; DESCRIPTION: Composite: Draws a orange rectangle at (402, 17) with width 96 and height 32 then Places a orange line segment connecting (181, 186) to (25, 219) then Sets a single green pixel at (35, 4).
; PLAN: r0=402(x), r1=17(y), r2=96(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x1), r6=186(y1), r7=25(x2), r8=219(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=4(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 17
LDI r2, 96
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 186
LDI r7, 25
LDI r8, 219
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 4
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
