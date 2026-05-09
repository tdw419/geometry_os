; DESCRIPTION: Places a purple line segment connecting (410, 62) to (264, 70).
; PLAN: r0=410(x1), r1=62(y1), r2=264(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 62
LDI r2, 264
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
