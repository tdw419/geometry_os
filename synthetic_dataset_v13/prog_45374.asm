; DESCRIPTION: Renders a magenta line between points (206, 61) and (251, 93).
; PLAN: r0=206(x1), r1=61(y1), r2=251(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 61
LDI r2, 251
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
