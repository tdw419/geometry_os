; DESCRIPTION: Composite: Places a orange line segment connecting (296, 95) to (67, 242) then Places a white dot at position (137, 252) then Renders a green disk with center (472, 193) and radius 31.
; PLAN: r0=296(x1), r1=95(y1), r2=67(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=252(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=472(x), r11=193(y), r12=31(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 95
LDI r2, 67
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 252
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 472
LDI r11, 193
LDI r12, 31
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
