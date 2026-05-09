; DESCRIPTION: Draws a black line from (501, 120) to (194, 48).
; PLAN: r0=501(x1), r1=120(y1), r2=194(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 120
LDI r2, 194
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
