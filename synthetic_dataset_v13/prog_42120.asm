; DESCRIPTION: Draws a white line from (90, 88) to (149, 7).
; PLAN: r0=90(x1), r1=88(y1), r2=149(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 88
LDI r2, 149
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
