; DESCRIPTION: Renders a magenta line between points (450, 229) and (420, 71).
; PLAN: r0=450(x1), r1=229(y1), r2=420(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 229
LDI r2, 420
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
