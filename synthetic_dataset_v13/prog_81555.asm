; DESCRIPTION: Places a cyan line segment connecting (118, 201) to (502, 88).
; PLAN: r0=118(x1), r1=201(y1), r2=502(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 201
LDI r2, 502
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
