; DESCRIPTION: Renders a white line between points (381, 51) and (495, 31).
; PLAN: r0=381(x1), r1=51(y1), r2=495(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 51
LDI r2, 495
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
