; DESCRIPTION: Draws a magenta line from (196, 193) to (222, 193).
; PLAN: r0=196(x1), r1=193(y1), r2=222(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 193
LDI r2, 222
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
