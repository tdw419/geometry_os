; DESCRIPTION: Draws a red line from (80, 51) to (124, 198).
; PLAN: r0=80(x1), r1=51(y1), r2=124(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 51
LDI r2, 124
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
