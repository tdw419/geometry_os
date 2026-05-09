; DESCRIPTION: Renders a white line between points (79, 21) and (381, 241).
; PLAN: r0=79(x1), r1=21(y1), r2=381(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 21
LDI r2, 381
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
