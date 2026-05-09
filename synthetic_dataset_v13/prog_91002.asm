; DESCRIPTION: Places a purple line segment connecting (335, 222) to (281, 223).
; PLAN: r0=335(x1), r1=222(y1), r2=281(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 222
LDI r2, 281
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
