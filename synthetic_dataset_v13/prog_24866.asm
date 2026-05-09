; DESCRIPTION: Composite: Renders a yellow line between points (431, 233) and (257, 76) then Renders a yellow disk with center (188, 61) and radius 28.
; PLAN: r0=431(x1), r1=233(y1), r2=257(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=61(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 431
LDI r1, 233
LDI r2, 257
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 61
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
