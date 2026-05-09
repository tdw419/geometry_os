; DESCRIPTION: Places a red line segment connecting (195, 243) to (2, 114).
; PLAN: r0=195(x1), r1=243(y1), r2=2(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 243
LDI r2, 2
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
