; DESCRIPTION: Places a red line segment connecting (195, 29) to (249, 191).
; PLAN: r0=195(x1), r1=29(y1), r2=249(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 29
LDI r2, 249
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
