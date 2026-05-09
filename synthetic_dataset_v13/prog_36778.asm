; DESCRIPTION: Renders a magenta line between points (427, 127) and (91, 82).
; PLAN: r0=427(x1), r1=127(y1), r2=91(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 127
LDI r2, 91
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
