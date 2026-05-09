; DESCRIPTION: Renders a white line between points (87, 34) and (140, 254).
; PLAN: r0=87(x1), r1=34(y1), r2=140(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 34
LDI r2, 140
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
