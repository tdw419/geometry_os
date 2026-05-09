; DESCRIPTION: Places a yellow line segment connecting (217, 252) to (166, 196).
; PLAN: r0=217(x1), r1=252(y1), r2=166(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 252
LDI r2, 166
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
