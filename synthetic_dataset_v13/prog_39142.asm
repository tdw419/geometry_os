; DESCRIPTION: Renders a magenta line between points (314, 246) and (331, 146).
; PLAN: r0=314(x1), r1=246(y1), r2=331(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 246
LDI r2, 331
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
