; DESCRIPTION: Renders a magenta line between points (250, 75) and (403, 92).
; PLAN: r0=250(x1), r1=75(y1), r2=403(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 75
LDI r2, 403
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
