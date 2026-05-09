; DESCRIPTION: Places a black line segment connecting (280, 220) to (431, 96).
; PLAN: r0=280(x1), r1=220(y1), r2=431(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 220
LDI r2, 431
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
