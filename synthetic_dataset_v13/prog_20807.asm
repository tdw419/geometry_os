; DESCRIPTION: Places a magenta line segment connecting (47, 146) to (136, 107).
; PLAN: r0=47(x1), r1=146(y1), r2=136(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 146
LDI r2, 136
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
