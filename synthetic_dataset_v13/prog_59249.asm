; DESCRIPTION: Draws a red line from (483, 22) to (324, 196).
; PLAN: r0=483(x1), r1=22(y1), r2=324(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 22
LDI r2, 324
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
