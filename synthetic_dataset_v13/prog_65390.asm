; DESCRIPTION: Renders a magenta line between points (10, 60) and (111, 68).
; PLAN: r0=10(x1), r1=60(y1), r2=111(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 60
LDI r2, 111
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
