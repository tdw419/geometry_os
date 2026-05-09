; DESCRIPTION: Renders a blue line between points (361, 194) and (23, 80).
; PLAN: r0=361(x1), r1=194(y1), r2=23(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 194
LDI r2, 23
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
