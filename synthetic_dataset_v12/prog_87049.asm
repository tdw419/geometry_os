; DESCRIPTION: Places a black line segment connecting (285, 210) to (350, 148).
; PLAN: r0=285(x1), r1=210(y1), r2=350(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 210
LDI r2, 350
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
