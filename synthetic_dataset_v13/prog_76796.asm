; DESCRIPTION: Renders a white line between points (227, 74) and (61, 172).
; PLAN: r0=227(x1), r1=74(y1), r2=61(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 74
LDI r2, 61
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
