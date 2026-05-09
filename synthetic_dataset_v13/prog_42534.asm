; DESCRIPTION: Renders a magenta line between points (182, 211) and (83, 92).
; PLAN: r0=182(x1), r1=211(y1), r2=83(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 211
LDI r2, 83
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
