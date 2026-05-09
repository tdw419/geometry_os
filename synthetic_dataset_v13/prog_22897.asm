; DESCRIPTION: Renders a green line between points (466, 135) and (199, 81).
; PLAN: r0=466(x1), r1=135(y1), r2=199(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 135
LDI r2, 199
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
