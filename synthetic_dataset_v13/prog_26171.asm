; DESCRIPTION: Renders a magenta line between points (99, 42) and (145, 76).
; PLAN: r0=99(x1), r1=42(y1), r2=145(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 42
LDI r2, 145
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
