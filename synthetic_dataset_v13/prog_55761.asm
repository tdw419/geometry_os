; DESCRIPTION: Draws a red line from (51, 219) to (161, 52).
; PLAN: r0=51(x1), r1=219(y1), r2=161(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 219
LDI r2, 161
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
