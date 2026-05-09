; DESCRIPTION: Renders a magenta line between points (335, 69) and (70, 76).
; PLAN: r0=335(x1), r1=69(y1), r2=70(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 69
LDI r2, 70
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
