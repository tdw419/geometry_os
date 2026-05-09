; DESCRIPTION: Places a black line segment connecting (373, 86) to (300, 28).
; PLAN: r0=373(x1), r1=86(y1), r2=300(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 86
LDI r2, 300
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
