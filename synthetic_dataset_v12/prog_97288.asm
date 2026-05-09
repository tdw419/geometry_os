; DESCRIPTION: Places a yellow line segment connecting (277, 81) to (406, 81).
; PLAN: r0=277(x1), r1=81(y1), r2=406(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 81
LDI r2, 406
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
