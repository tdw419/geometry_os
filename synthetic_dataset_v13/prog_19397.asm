; DESCRIPTION: Renders a white line between points (219, 177) and (454, 6).
; PLAN: r0=219(x1), r1=177(y1), r2=454(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 177
LDI r2, 454
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
