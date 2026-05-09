; DESCRIPTION: Draws a red line from (51, 7) to (144, 100).
; PLAN: r0=51(x1), r1=7(y1), r2=144(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 7
LDI r2, 144
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
