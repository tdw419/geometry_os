; DESCRIPTION: Composite: Places a red line segment connecting (181, 91) to (160, 108) then Places a yellow dot at position (479, 219) then Renders a green disk with center (94, 161) and radius 76.
; PLAN: r0=181(x1), r1=91(y1), r2=160(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=479(x), r6=219(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=161(y), r12=76(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 91
LDI r2, 160
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 219
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 94
LDI r11, 161
LDI r12, 76
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
