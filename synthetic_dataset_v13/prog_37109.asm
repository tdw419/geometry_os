; DESCRIPTION: Renders a yellow line between points (294, 4) and (384, 201).
; PLAN: r0=294(x1), r1=4(y1), r2=384(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 4
LDI r2, 384
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
