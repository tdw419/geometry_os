; DESCRIPTION: Renders a yellow line between points (431, 152) and (447, 162).
; PLAN: r0=431(x1), r1=152(y1), r2=447(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 152
LDI r2, 447
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
