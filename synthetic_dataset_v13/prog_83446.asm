; DESCRIPTION: Renders a green line between points (233, 142) and (308, 97).
; PLAN: r0=233(x1), r1=142(y1), r2=308(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 142
LDI r2, 308
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
