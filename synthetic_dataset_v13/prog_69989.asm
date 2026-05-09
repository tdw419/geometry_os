; DESCRIPTION: Renders a red line between points (381, 31) and (124, 219).
; PLAN: r0=381(x1), r1=31(y1), r2=124(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 31
LDI r2, 124
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
