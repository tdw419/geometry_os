; DESCRIPTION: Composite: Draws a orange line from (507, 74) to (99, 136) then Places a cyan circle of radius 26 at center (62, 170).
; PLAN: r0=507(x1), r1=74(y1), r2=99(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=170(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 74
LDI r2, 99
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 170
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
