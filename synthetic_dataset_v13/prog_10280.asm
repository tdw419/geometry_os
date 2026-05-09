; DESCRIPTION: Renders a magenta line between points (71, 75) and (207, 156).
; PLAN: r0=71(x1), r1=75(y1), r2=207(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 75
LDI r2, 207
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
