; DESCRIPTION: Draws a blue line from (444, 131) to (267, 214).
; PLAN: r0=444(x1), r1=131(y1), r2=267(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 131
LDI r2, 267
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
