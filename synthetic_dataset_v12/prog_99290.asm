; DESCRIPTION: Draws a white line from (501, 12) to (483, 16).
; PLAN: r0=501(x1), r1=12(y1), r2=483(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 12
LDI r2, 483
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
