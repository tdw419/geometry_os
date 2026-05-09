; DESCRIPTION: Places a yellow line segment connecting (37, 60) to (206, 240).
; PLAN: r0=37(x1), r1=60(y1), r2=206(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 60
LDI r2, 206
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
