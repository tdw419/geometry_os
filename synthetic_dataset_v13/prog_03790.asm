; DESCRIPTION: Places a green line segment connecting (425, 196) to (274, 112).
; PLAN: r0=425(x1), r1=196(y1), r2=274(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 196
LDI r2, 274
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
