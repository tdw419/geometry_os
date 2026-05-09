; DESCRIPTION: Draws a magenta line from (317, 113) to (444, 26).
; PLAN: r0=317(x1), r1=113(y1), r2=444(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 113
LDI r2, 444
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
