; DESCRIPTION: Draws a red line from (213, 100) to (133, 209).
; PLAN: r0=213(x1), r1=100(y1), r2=133(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 100
LDI r2, 133
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
