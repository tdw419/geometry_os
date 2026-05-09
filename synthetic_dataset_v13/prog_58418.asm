; DESCRIPTION: Composite: Renders a green disk with center (447, 108) and radius 15 then Places a purple line segment connecting (179, 170) to (326, 131) then Places a yellow dot at position (52, 166).
; PLAN: r0=447(x), r1=108(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x1), r6=170(y1), r7=326(x2), r8=131(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=52(x), r11=166(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 108
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 170
LDI r7, 326
LDI r8, 131
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 166
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
