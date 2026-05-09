; DESCRIPTION: Renders a white line between points (471, 97) and (261, 83).
; PLAN: r0=471(x1), r1=97(y1), r2=261(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 97
LDI r2, 261
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
