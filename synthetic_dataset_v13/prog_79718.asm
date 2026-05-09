; DESCRIPTION: Draws a blue line from (164, 127) to (376, 131).
; PLAN: r0=164(x1), r1=127(y1), r2=376(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 127
LDI r2, 376
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
