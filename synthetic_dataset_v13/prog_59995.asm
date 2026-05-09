; DESCRIPTION: Draws a green line from (419, 115) to (189, 90).
; PLAN: r0=419(x1), r1=115(y1), r2=189(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 115
LDI r2, 189
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
