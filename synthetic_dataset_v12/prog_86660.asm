; DESCRIPTION: Places a yellow line segment connecting (440, 14) to (275, 152).
; PLAN: r0=440(x1), r1=14(y1), r2=275(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 14
LDI r2, 275
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
