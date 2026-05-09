; DESCRIPTION: Renders a white line between points (451, 151) and (31, 143).
; PLAN: r0=451(x1), r1=151(y1), r2=31(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 151
LDI r2, 31
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
