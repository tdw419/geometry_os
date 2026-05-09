; DESCRIPTION: Places a black line segment connecting (12, 151) to (300, 92).
; PLAN: r0=12(x1), r1=151(y1), r2=300(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 151
LDI r2, 300
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
