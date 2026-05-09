; DESCRIPTION: Renders a magenta line between points (47, 85) and (156, 215).
; PLAN: r0=47(x1), r1=85(y1), r2=156(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 85
LDI r2, 156
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
