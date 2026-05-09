; DESCRIPTION: Places a blue line segment connecting (290, 96) to (328, 17).
; PLAN: r0=290(x1), r1=96(y1), r2=328(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 96
LDI r2, 328
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
