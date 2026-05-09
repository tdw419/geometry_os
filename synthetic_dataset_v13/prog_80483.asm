; DESCRIPTION: Composite: Places a green line segment connecting (233, 187) to (323, 237) then Places a magenta circle of radius 73 at center (259, 143) then Sets a single red pixel at (23, 97).
; PLAN: r0=233(x1), r1=187(y1), r2=323(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=143(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x), r11=97(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 233
LDI r1, 187
LDI r2, 323
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 143
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 97
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
