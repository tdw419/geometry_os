; DESCRIPTION: Composite: Sets a single blue pixel at (409, 172) then Places a purple line segment connecting (398, 169) to (115, 136) then Renders a cyan box of size 60x62 starting at (292, 168).
; PLAN: r0=409(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=398(x1), r6=169(y1), r7=115(x2), r8=136(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=292(x), r11=168(y), r12=60(width), r13=62(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 398
LDI r6, 169
LDI r7, 115
LDI r8, 136
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 168
LDI r12, 60
LDI r13, 62
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
