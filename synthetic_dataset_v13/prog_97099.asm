; DESCRIPTION: Renders a magenta line between points (174, 182) and (3, 203).
; PLAN: r0=174(x1), r1=182(y1), r2=3(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 182
LDI r2, 3
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
