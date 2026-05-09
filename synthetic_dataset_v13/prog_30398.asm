; DESCRIPTION: Renders a green line between points (199, 179) and (13, 71).
; PLAN: r0=199(x1), r1=179(y1), r2=13(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 179
LDI r2, 13
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
