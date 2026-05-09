; DESCRIPTION: Draws a black line from (124, 70) to (40, 158).
; PLAN: r0=124(x1), r1=70(y1), r2=40(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 70
LDI r2, 40
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
