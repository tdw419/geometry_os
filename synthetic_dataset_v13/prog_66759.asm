; DESCRIPTION: Places a yellow line segment connecting (465, 54) to (0, 47).
; PLAN: r0=465(x1), r1=54(y1), r2=0(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 54
LDI r2, 0
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
