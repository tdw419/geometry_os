; DESCRIPTION: Renders a magenta line between points (236, 74) and (162, 57).
; PLAN: r0=236(x1), r1=74(y1), r2=162(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 74
LDI r2, 162
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
