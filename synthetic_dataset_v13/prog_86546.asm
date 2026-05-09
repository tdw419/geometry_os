; DESCRIPTION: Renders a magenta line between points (368, 167) and (453, 2).
; PLAN: r0=368(x1), r1=167(y1), r2=453(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 167
LDI r2, 453
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
