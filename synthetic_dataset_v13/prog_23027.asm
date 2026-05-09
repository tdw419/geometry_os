; DESCRIPTION: Places a purple line segment connecting (91, 17) to (259, 113).
; PLAN: r0=91(x1), r1=17(y1), r2=259(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 17
LDI r2, 259
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
