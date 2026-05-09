; DESCRIPTION: Renders a blue line between points (449, 182) and (353, 171).
; PLAN: r0=449(x1), r1=182(y1), r2=353(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 182
LDI r2, 353
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
