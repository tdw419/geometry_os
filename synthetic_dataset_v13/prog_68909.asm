; DESCRIPTION: Renders a magenta line between points (308, 160) and (91, 78).
; PLAN: r0=308(x1), r1=160(y1), r2=91(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 160
LDI r2, 91
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
