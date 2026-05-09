; DESCRIPTION: Renders a magenta line between points (438, 65) and (341, 178).
; PLAN: r0=438(x1), r1=65(y1), r2=341(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 65
LDI r2, 341
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
