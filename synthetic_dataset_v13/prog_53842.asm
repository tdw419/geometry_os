; DESCRIPTION: Renders a white line between points (97, 50) and (505, 156).
; PLAN: r0=97(x1), r1=50(y1), r2=505(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 50
LDI r2, 505
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
