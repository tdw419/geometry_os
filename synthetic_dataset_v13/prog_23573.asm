; DESCRIPTION: Draws a magenta line from (315, 36) to (135, 247).
; PLAN: r0=315(x1), r1=36(y1), r2=135(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 36
LDI r2, 135
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
