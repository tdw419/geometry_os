; DESCRIPTION: Draws a red line from (366, 51) to (185, 234).
; PLAN: r0=366(x1), r1=51(y1), r2=185(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 51
LDI r2, 185
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
