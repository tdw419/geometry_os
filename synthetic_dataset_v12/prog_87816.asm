; DESCRIPTION: Places a yellow line segment connecting (418, 29) to (217, 59).
; PLAN: r0=418(x1), r1=29(y1), r2=217(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 29
LDI r2, 217
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
