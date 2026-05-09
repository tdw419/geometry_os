; DESCRIPTION: Places a yellow line segment connecting (300, 130) to (240, 148).
; PLAN: r0=300(x1), r1=130(y1), r2=240(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 130
LDI r2, 240
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
