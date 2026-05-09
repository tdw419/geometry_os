; DESCRIPTION: Places a black line segment connecting (373, 29) to (329, 59).
; PLAN: r0=373(x1), r1=29(y1), r2=329(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 29
LDI r2, 329
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
