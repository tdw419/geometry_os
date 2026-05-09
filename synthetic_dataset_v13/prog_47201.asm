; DESCRIPTION: Renders a magenta line between points (489, 2) and (371, 16).
; PLAN: r0=489(x1), r1=2(y1), r2=371(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 2
LDI r2, 371
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
