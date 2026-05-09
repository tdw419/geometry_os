; DESCRIPTION: Renders a white line between points (91, 132) and (361, 77).
; PLAN: r0=91(x1), r1=132(y1), r2=361(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 132
LDI r2, 361
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
