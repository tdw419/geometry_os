; DESCRIPTION: Renders a white line between points (31, 81) and (39, 14).
; PLAN: r0=31(x1), r1=81(y1), r2=39(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 81
LDI r2, 39
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
