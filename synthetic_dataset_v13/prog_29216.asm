; DESCRIPTION: Composite: Places a black circle of radius 52 at center (143, 93) then Draws a yellow line from (38, 62) to (383, 224) then Sets a single yellow pixel at (148, 230).
; PLAN: r0=143(x), r1=93(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=62(y1), r7=383(x2), r8=224(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=230(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 93
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 62
LDI r7, 383
LDI r8, 224
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 230
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
