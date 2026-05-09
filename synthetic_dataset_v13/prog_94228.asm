; DESCRIPTION: Composite: Renders a black box of size 38x78 starting at (383, 94) then Sets a single green pixel at (88, 139) then Places a cyan circle of radius 51 at center (446, 188).
; PLAN: r0=383(x), r1=94(y), r2=38(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=139(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=446(x), r11=188(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 94
LDI r2, 38
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 139
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 446
LDI r11, 188
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
