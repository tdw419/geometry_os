; DESCRIPTION: Renders a magenta line between points (130, 107) and (508, 212).
; PLAN: r0=130(x1), r1=107(y1), r2=508(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 107
LDI r2, 508
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
