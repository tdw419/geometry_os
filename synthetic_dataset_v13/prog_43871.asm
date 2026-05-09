; DESCRIPTION: Renders a magenta line between points (11, 107) and (353, 134).
; PLAN: r0=11(x1), r1=107(y1), r2=353(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 107
LDI r2, 353
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
