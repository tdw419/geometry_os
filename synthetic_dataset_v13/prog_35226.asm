; DESCRIPTION: Draws a blue line from (150, 253) to (236, 165).
; PLAN: r0=150(x1), r1=253(y1), r2=236(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 253
LDI r2, 236
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
