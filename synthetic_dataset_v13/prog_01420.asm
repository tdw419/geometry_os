; DESCRIPTION: Places a red line segment connecting (277, 23) to (231, 70).
; PLAN: r0=277(x1), r1=23(y1), r2=231(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 23
LDI r2, 231
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
