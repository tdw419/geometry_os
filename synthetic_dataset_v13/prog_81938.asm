; DESCRIPTION: Places a green line segment connecting (338, 242) to (390, 253).
; PLAN: r0=338(x1), r1=242(y1), r2=390(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 242
LDI r2, 390
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
