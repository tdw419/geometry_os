; DESCRIPTION: Places a yellow line segment connecting (243, 56) to (154, 60).
; PLAN: r0=243(x1), r1=56(y1), r2=154(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 56
LDI r2, 154
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
