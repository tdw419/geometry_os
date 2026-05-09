; DESCRIPTION: Places a yellow line segment connecting (154, 13) to (243, 230).
; PLAN: r0=154(x1), r1=13(y1), r2=243(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 13
LDI r2, 243
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
