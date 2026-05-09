; DESCRIPTION: Renders a green line between points (327, 191) and (376, 201).
; PLAN: r0=327(x1), r1=191(y1), r2=376(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 191
LDI r2, 376
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
