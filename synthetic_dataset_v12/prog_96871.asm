; DESCRIPTION: Places a yellow line segment connecting (96, 11) to (69, 150).
; PLAN: r0=96(x1), r1=11(y1), r2=69(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 11
LDI r2, 69
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
