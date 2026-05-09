; DESCRIPTION: Draws a yellow line from (145, 193) to (362, 199).
; PLAN: r0=145(x1), r1=193(y1), r2=362(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 193
LDI r2, 362
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
