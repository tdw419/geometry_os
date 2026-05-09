; DESCRIPTION: Composite: Draws a magenta circle centered at (323, 72) with radius 23 then Renders a black line between points (257, 232) and (293, 242) then Sets a single green pixel at (10, 177).
; PLAN: r0=323(x), r1=72(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=232(y1), r7=293(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=10(x), r11=177(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 72
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 232
LDI r7, 293
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 177
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
