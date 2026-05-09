; DESCRIPTION: Draws a red line from (15, 199) to (483, 125).
; PLAN: r0=15(x1), r1=199(y1), r2=483(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 199
LDI r2, 483
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
