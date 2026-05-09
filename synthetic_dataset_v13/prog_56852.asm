; DESCRIPTION: Places a yellow line segment connecting (445, 30) to (468, 17).
; PLAN: r0=445(x1), r1=30(y1), r2=468(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 30
LDI r2, 468
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
