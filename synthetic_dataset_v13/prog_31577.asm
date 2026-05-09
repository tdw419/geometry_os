; DESCRIPTION: Renders a magenta line between points (61, 63) and (48, 118).
; PLAN: r0=61(x1), r1=63(y1), r2=48(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 63
LDI r2, 48
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
