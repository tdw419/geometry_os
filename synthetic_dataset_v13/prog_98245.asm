; DESCRIPTION: Draws a yellow line from (131, 51) to (84, 63).
; PLAN: r0=131(x1), r1=51(y1), r2=84(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 51
LDI r2, 84
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
