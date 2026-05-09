; DESCRIPTION: Renders a magenta line between points (303, 79) and (177, 199).
; PLAN: r0=303(x1), r1=79(y1), r2=177(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 79
LDI r2, 177
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
