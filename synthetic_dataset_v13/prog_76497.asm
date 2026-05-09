; DESCRIPTION: Renders a magenta line between points (130, 66) and (508, 173).
; PLAN: r0=130(x1), r1=66(y1), r2=508(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 66
LDI r2, 508
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
