; DESCRIPTION: Places a yellow line segment connecting (70, 113) to (253, 178).
; PLAN: r0=70(x1), r1=113(y1), r2=253(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 113
LDI r2, 253
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
