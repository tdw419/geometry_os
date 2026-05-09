; DESCRIPTION: Renders a magenta line between points (299, 92) and (11, 208).
; PLAN: r0=299(x1), r1=92(y1), r2=11(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 92
LDI r2, 11
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
