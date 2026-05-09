; DESCRIPTION: Composite: Renders a yellow box of size 49x85 starting at (390, 26) then Places a orange circle of radius 38 at center (374, 158).
; PLAN: r0=390(x), r1=26(y), r2=49(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=158(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 390
LDI r1, 26
LDI r2, 49
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 158
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
