; DESCRIPTION: Renders a magenta line between points (306, 132) and (368, 83).
; PLAN: r0=306(x1), r1=132(y1), r2=368(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 132
LDI r2, 368
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
