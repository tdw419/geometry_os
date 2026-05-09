; DESCRIPTION: Renders a yellow line between points (96, 194) and (361, 1).
; PLAN: r0=96(x1), r1=194(y1), r2=361(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 194
LDI r2, 361
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
