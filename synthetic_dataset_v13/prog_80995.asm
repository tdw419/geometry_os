; DESCRIPTION: Composite: Places a yellow line segment connecting (417, 242) to (294, 0) then Creates a green circular shape at (237, 136) with radius 63.
; PLAN: r0=417(x1), r1=242(y1), r2=294(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=136(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 242
LDI r2, 294
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 136
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
