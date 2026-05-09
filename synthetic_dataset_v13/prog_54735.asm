; DESCRIPTION: Places a white line segment connecting (448, 176) to (481, 161).
; PLAN: r0=448(x1), r1=176(y1), r2=481(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 176
LDI r2, 481
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
