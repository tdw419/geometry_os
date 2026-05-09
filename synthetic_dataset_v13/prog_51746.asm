; DESCRIPTION: Renders a green line between points (469, 142) and (449, 157).
; PLAN: r0=469(x1), r1=142(y1), r2=449(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 142
LDI r2, 449
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
