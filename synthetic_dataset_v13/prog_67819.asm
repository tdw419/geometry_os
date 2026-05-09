; DESCRIPTION: Places a black line segment connecting (270, 49) to (160, 113).
; PLAN: r0=270(x1), r1=49(y1), r2=160(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 49
LDI r2, 160
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
