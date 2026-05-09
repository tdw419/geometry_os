; DESCRIPTION: Renders a magenta line between points (188, 61) and (135, 103).
; PLAN: r0=188(x1), r1=61(y1), r2=135(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 61
LDI r2, 135
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
