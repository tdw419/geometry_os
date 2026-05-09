; DESCRIPTION: Draws a white line from (76, 133) to (86, 185).
; PLAN: r0=76(x1), r1=133(y1), r2=86(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 133
LDI r2, 86
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
