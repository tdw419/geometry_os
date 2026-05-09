; DESCRIPTION: Draws a white line from (258, 30) to (481, 233).
; PLAN: r0=258(x1), r1=30(y1), r2=481(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 30
LDI r2, 481
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
