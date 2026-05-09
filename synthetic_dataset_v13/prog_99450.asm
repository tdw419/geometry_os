; DESCRIPTION: Renders a magenta line between points (250, 129) and (429, 72).
; PLAN: r0=250(x1), r1=129(y1), r2=429(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 129
LDI r2, 429
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
