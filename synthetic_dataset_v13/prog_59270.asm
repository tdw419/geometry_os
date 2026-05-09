; DESCRIPTION: Draws a red line from (265, 250) to (390, 196).
; PLAN: r0=265(x1), r1=250(y1), r2=390(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 250
LDI r2, 390
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
