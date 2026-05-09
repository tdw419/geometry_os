; DESCRIPTION: Composite: Renders a black line between points (212, 144) and (65, 63) then Draws a cyan rectangle at (135, 35) with width 61 and height 16 then Creates a orange circular shape at (278, 137) with radius 78.
; PLAN: r0=212(x1), r1=144(y1), r2=65(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=35(y), r7=61(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x), r11=137(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 144
LDI r2, 65
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 35
LDI r7, 61
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 137
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
