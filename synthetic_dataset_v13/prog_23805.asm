; DESCRIPTION: Places a magenta line segment connecting (149, 98) to (438, 154).
; PLAN: r0=149(x1), r1=98(y1), r2=438(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 98
LDI r2, 438
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
