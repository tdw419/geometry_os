; DESCRIPTION: Draws a magenta line from (23, 135) to (145, 143).
; PLAN: r0=23(x1), r1=135(y1), r2=145(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 135
LDI r2, 145
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
