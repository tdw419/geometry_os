; DESCRIPTION: Draws a green line from (476, 159) to (475, 65).
; PLAN: r0=476(x1), r1=159(y1), r2=475(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 159
LDI r2, 475
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
