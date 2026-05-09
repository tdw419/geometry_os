; DESCRIPTION: Draws a magenta line from (340, 133) to (449, 100).
; PLAN: r0=340(x1), r1=133(y1), r2=449(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 133
LDI r2, 449
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
