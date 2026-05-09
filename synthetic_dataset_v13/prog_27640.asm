; DESCRIPTION: Renders a blue line between points (150, 182) and (413, 87).
; PLAN: r0=150(x1), r1=182(y1), r2=413(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 182
LDI r2, 413
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
