; DESCRIPTION: Composite: Renders a purple box of size 37x20 starting at (64, 226) then Places a green line segment connecting (302, 31) to (226, 252) then Renders a green disk with center (286, 180) and radius 46.
; PLAN: r0=64(x), r1=226(y), r2=37(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x1), r6=31(y1), r7=226(x2), r8=252(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=180(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 226
LDI r2, 37
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 31
LDI r7, 226
LDI r8, 252
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 180
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
