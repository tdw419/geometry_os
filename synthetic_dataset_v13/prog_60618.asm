; DESCRIPTION: Renders a white line between points (366, 194) and (478, 64).
; PLAN: r0=366(x1), r1=194(y1), r2=478(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 194
LDI r2, 478
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
