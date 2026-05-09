; DESCRIPTION: Renders a green line between points (425, 241) and (471, 34).
; PLAN: r0=425(x1), r1=241(y1), r2=471(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 241
LDI r2, 471
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
