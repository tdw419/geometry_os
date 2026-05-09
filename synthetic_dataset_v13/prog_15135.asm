; DESCRIPTION: Draws a black line from (292, 184) to (428, 76).
; PLAN: r0=292(x1), r1=184(y1), r2=428(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 184
LDI r2, 428
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
