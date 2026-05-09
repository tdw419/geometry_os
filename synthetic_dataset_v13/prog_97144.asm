; DESCRIPTION: Renders a magenta line between points (134, 194) and (220, 156).
; PLAN: r0=134(x1), r1=194(y1), r2=220(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 194
LDI r2, 220
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
