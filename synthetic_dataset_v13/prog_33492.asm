; DESCRIPTION: Composite: Places a red circle of radius 74 at center (259, 96) then Places a cyan dot at position (205, 52) then Renders a black line between points (449, 163) and (78, 97).
; PLAN: r0=259(x), r1=96(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=52(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=449(x1), r11=163(y1), r12=78(x2), r13=97(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 96
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 52
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 449
LDI r11, 163
LDI r12, 78
LDI r13, 97
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
