; DESCRIPTION: Draws a red line from (51, 34) to (333, 196).
; PLAN: r0=51(x1), r1=34(y1), r2=333(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 34
LDI r2, 333
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
