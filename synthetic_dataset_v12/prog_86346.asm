; DESCRIPTION: Places a yellow line segment connecting (274, 178) to (242, 201).
; PLAN: r0=274(x1), r1=178(y1), r2=242(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 178
LDI r2, 242
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
