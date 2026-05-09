; DESCRIPTION: Places a green line segment connecting (269, 120) to (47, 188).
; PLAN: r0=269(x1), r1=120(y1), r2=47(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 120
LDI r2, 47
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
