; DESCRIPTION: Draws a green line from (497, 142) to (161, 207).
; PLAN: r0=497(x1), r1=142(y1), r2=161(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 142
LDI r2, 161
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
