; DESCRIPTION: Composite: Places a purple line segment connecting (86, 38) to (307, 194) then Places a orange dot at position (438, 207) then Renders a white disk with center (190, 210) and radius 41.
; PLAN: r0=86(x1), r1=38(y1), r2=307(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=207(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=210(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 38
LDI r2, 307
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 207
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 190
LDI r11, 210
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
