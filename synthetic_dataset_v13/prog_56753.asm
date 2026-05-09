; DESCRIPTION: Places a red line segment connecting (97, 30) to (277, 108).
; PLAN: r0=97(x1), r1=30(y1), r2=277(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 30
LDI r2, 277
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
