; DESCRIPTION: Renders a green line between points (81, 227) and (289, 60).
; PLAN: r0=81(x1), r1=227(y1), r2=289(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 227
LDI r2, 289
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
