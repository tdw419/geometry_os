; DESCRIPTION: Draws a magenta line from (324, 2) to (50, 31).
; PLAN: r0=324(x1), r1=2(y1), r2=50(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 2
LDI r2, 50
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
