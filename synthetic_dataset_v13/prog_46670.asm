; DESCRIPTION: Draws a magenta line from (431, 6) to (473, 173).
; PLAN: r0=431(x1), r1=6(y1), r2=473(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 6
LDI r2, 473
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
