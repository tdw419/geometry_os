; DESCRIPTION: Draws a black line from (323, 76) to (355, 125).
; PLAN: r0=323(x1), r1=76(y1), r2=355(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 76
LDI r2, 355
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
