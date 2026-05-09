; DESCRIPTION: Renders a magenta line between points (328, 220) and (79, 218).
; PLAN: r0=328(x1), r1=220(y1), r2=79(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 220
LDI r2, 79
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
