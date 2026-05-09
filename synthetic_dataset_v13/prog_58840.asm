; DESCRIPTION: Renders a magenta line between points (61, 146) and (419, 62).
; PLAN: r0=61(x1), r1=146(y1), r2=419(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 146
LDI r2, 419
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
