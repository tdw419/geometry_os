; DESCRIPTION: Renders a magenta line between points (189, 30) and (68, 240).
; PLAN: r0=189(x1), r1=30(y1), r2=68(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 30
LDI r2, 68
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
