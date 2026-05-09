; DESCRIPTION: Renders a magenta line between points (6, 81) and (152, 202).
; PLAN: r0=6(x1), r1=81(y1), r2=152(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 81
LDI r2, 152
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
