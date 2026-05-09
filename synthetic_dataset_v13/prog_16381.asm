; DESCRIPTION: Renders a magenta line between points (489, 39) and (30, 131).
; PLAN: r0=489(x1), r1=39(y1), r2=30(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 39
LDI r2, 30
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
