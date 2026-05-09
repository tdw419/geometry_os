; DESCRIPTION: Draws a magenta line from (218, 112) to (449, 180).
; PLAN: r0=218(x1), r1=112(y1), r2=449(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 112
LDI r2, 449
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
