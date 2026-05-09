; DESCRIPTION: Places a yellow line segment connecting (236, 4) to (369, 27).
; PLAN: r0=236(x1), r1=4(y1), r2=369(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 4
LDI r2, 369
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
