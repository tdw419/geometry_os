; DESCRIPTION: Places a yellow line segment connecting (178, 230) to (253, 123).
; PLAN: r0=178(x1), r1=230(y1), r2=253(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 230
LDI r2, 253
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
