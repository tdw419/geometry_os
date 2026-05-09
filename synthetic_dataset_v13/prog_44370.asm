; DESCRIPTION: Draws a white line from (134, 138) to (325, 168).
; PLAN: r0=134(x1), r1=138(y1), r2=325(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 138
LDI r2, 325
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
