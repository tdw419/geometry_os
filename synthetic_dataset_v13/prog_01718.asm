; DESCRIPTION: Draws a white line from (26, 238) to (337, 162).
; PLAN: r0=26(x1), r1=238(y1), r2=337(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 238
LDI r2, 337
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
