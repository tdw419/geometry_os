; DESCRIPTION: Draws a red line from (229, 43) to (362, 135).
; PLAN: r0=229(x1), r1=43(y1), r2=362(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 43
LDI r2, 362
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
