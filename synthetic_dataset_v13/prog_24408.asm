; DESCRIPTION: Places a yellow line segment connecting (15, 226) to (169, 236).
; PLAN: r0=15(x1), r1=226(y1), r2=169(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 226
LDI r2, 169
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
