; DESCRIPTION: Renders a magenta line between points (79, 247) and (115, 14).
; PLAN: r0=79(x1), r1=247(y1), r2=115(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 247
LDI r2, 115
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
