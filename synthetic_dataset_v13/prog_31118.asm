; DESCRIPTION: Composite: Renders a blue line between points (212, 225) and (475, 214) then Places a orange 39x106 rectangle at position (374, 130) then Places a green dot at position (22, 181).
; PLAN: r0=212(x1), r1=225(y1), r2=475(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=130(y), r7=39(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x), r11=181(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 225
LDI r2, 475
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 130
LDI r7, 39
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 181
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
