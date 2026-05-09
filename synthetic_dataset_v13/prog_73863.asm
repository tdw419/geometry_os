; DESCRIPTION: Composite: Draws a magenta circle centered at (231, 86) with radius 71 then Draws a green line from (219, 64) to (119, 80) then Sets a single black pixel at (34, 217).
; PLAN: r0=231(x), r1=86(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=64(y1), r7=119(x2), r8=80(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=217(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 86
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 64
LDI r7, 119
LDI r8, 80
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 217
LDI r12, 0x000000
PSET r10, r11, r12
HALT
