; DESCRIPTION: Composite: Places a blue dot at position (62, 41) then Draws a blue circle centered at (45, 206) with radius 45 then Places a yellow line segment connecting (306, 155) to (305, 45).
; PLAN: r0=62(x), r1=41(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=206(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x1), r11=155(y1), r12=305(x2), r13=45(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 41
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 206
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 155
LDI r12, 305
LDI r13, 45
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
