; DESCRIPTION: Draws a red line from (362, 188) to (369, 128).
; PLAN: r0=362(x1), r1=188(y1), r2=369(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 188
LDI r2, 369
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
