; DESCRIPTION: Renders a white line between points (381, 210) and (31, 133).
; PLAN: r0=381(x1), r1=210(y1), r2=31(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 210
LDI r2, 31
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
