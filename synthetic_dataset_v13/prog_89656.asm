; DESCRIPTION: Draws a magenta line from (184, 214) to (141, 11).
; PLAN: r0=184(x1), r1=214(y1), r2=141(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 214
LDI r2, 141
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
