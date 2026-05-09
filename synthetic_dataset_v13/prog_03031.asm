; DESCRIPTION: Composite: Draws a red rectangle at (111, 4) with width 104 and height 42 then Places a blue line segment connecting (86, 77) to (44, 9) then Sets a single white pixel at (498, 253).
; PLAN: r0=111(x), r1=4(y), r2=104(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x1), r6=77(y1), r7=44(x2), r8=9(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=498(x), r11=253(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 111
LDI r1, 4
LDI r2, 104
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 77
LDI r7, 44
LDI r8, 9
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 253
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
