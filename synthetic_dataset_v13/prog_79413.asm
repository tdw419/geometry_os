; DESCRIPTION: Renders a magenta line between points (234, 68) and (419, 220).
; PLAN: r0=234(x1), r1=68(y1), r2=419(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 68
LDI r2, 419
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
