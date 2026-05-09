; DESCRIPTION: Composite: Renders a magenta box of size 56x76 starting at (235, 94) then Renders a blue disk with center (456, 193) and radius 41 then Draws a yellow line from (6, 23) to (235, 170).
; PLAN: r0=235(x), r1=94(y), r2=56(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=193(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x1), r11=23(y1), r12=235(x2), r13=170(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 94
LDI r2, 56
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 193
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 23
LDI r12, 235
LDI r13, 170
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
