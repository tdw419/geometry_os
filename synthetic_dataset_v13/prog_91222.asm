; DESCRIPTION: Renders a magenta line between points (163, 120) and (445, 69).
; PLAN: r0=163(x1), r1=120(y1), r2=445(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 120
LDI r2, 445
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
