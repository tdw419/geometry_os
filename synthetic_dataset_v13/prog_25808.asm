; DESCRIPTION: Composite: Renders a yellow box of size 55x119 starting at (136, 85) then Draws a orange line from (65, 48) to (211, 5) then Places a blue dot at position (121, 52).
; PLAN: r0=136(x), r1=85(y), r2=55(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=48(y1), r7=211(x2), r8=5(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=121(x), r11=52(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 85
LDI r2, 55
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 48
LDI r7, 211
LDI r8, 5
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 52
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
