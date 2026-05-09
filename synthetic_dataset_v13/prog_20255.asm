; DESCRIPTION: Places a red line segment connecting (205, 195) to (169, 72).
; PLAN: r0=205(x1), r1=195(y1), r2=169(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 195
LDI r2, 169
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
