; DESCRIPTION: Composite: Places a green dot at position (210, 172) then Places a yellow 48x85 rectangle at position (347, 6) then Renders a blue line between points (432, 164) and (148, 130).
; PLAN: r0=210(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=6(y), r7=48(width), r8=85(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=432(x1), r11=164(y1), r12=148(x2), r13=130(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 347
LDI r6, 6
LDI r7, 48
LDI r8, 85
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 164
LDI r12, 148
LDI r13, 130
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
