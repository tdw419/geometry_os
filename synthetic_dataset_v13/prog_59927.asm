; DESCRIPTION: Places a yellow line segment connecting (354, 65) to (277, 168).
; PLAN: r0=354(x1), r1=65(y1), r2=277(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 65
LDI r2, 277
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
