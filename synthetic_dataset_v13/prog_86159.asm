; DESCRIPTION: Renders a magenta line between points (48, 5) and (489, 18).
; PLAN: r0=48(x1), r1=5(y1), r2=489(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 5
LDI r2, 489
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
