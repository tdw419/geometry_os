; DESCRIPTION: Draws a magenta line from (236, 164) to (377, 138).
; PLAN: r0=236(x1), r1=164(y1), r2=377(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 164
LDI r2, 377
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
