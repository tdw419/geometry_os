; DESCRIPTION: Composite: Renders a yellow line between points (476, 192) and (196, 157) then Sets a single magenta pixel at (373, 224).
; PLAN: r0=476(x1), r1=192(y1), r2=196(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=224(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 476
LDI r1, 192
LDI r2, 196
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 224
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
