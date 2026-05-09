; DESCRIPTION: Places a green line segment connecting (195, 9) to (169, 83).
; PLAN: r0=195(x1), r1=9(y1), r2=169(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 9
LDI r2, 169
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
