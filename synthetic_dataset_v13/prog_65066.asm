; DESCRIPTION: Draws a magenta line from (421, 187) to (266, 218).
; PLAN: r0=421(x1), r1=187(y1), r2=266(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 187
LDI r2, 266
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
