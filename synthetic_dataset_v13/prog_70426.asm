; DESCRIPTION: Places a yellow line segment connecting (124, 96) to (165, 65).
; PLAN: r0=124(x1), r1=96(y1), r2=165(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 96
LDI r2, 165
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
