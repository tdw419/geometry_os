; DESCRIPTION: Renders a magenta line between points (466, 90) and (103, 73).
; PLAN: r0=466(x1), r1=90(y1), r2=103(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 90
LDI r2, 103
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
