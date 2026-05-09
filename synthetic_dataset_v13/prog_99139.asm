; DESCRIPTION: Renders a green line between points (201, 214) and (32, 77).
; PLAN: r0=201(x1), r1=214(y1), r2=32(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 214
LDI r2, 32
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
