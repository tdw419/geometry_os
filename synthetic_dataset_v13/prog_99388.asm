; DESCRIPTION: Draws a white line from (95, 78) to (337, 158).
; PLAN: r0=95(x1), r1=78(y1), r2=337(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 78
LDI r2, 337
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
