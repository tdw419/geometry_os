; DESCRIPTION: Composite: Draws a blue rectangle at (399, 1) with width 50 and height 114 then Places a orange line segment connecting (294, 229) to (132, 104) then Sets a single white pixel at (50, 96).
; PLAN: r0=399(x), r1=1(y), r2=50(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x1), r6=229(y1), r7=132(x2), r8=104(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=96(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 1
LDI r2, 50
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 229
LDI r7, 132
LDI r8, 104
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 96
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
