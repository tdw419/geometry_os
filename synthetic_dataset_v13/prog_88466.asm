; DESCRIPTION: Places a white line segment connecting (11, 117) to (155, 171).
; PLAN: r0=11(x1), r1=117(y1), r2=155(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 117
LDI r2, 155
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
