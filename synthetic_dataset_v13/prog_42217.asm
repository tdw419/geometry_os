; DESCRIPTION: Places a yellow line segment connecting (279, 166) to (300, 149).
; PLAN: r0=279(x1), r1=166(y1), r2=300(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 166
LDI r2, 300
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
