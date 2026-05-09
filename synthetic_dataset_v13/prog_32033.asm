; DESCRIPTION: Places a black line segment connecting (24, 152) to (324, 39).
; PLAN: r0=24(x1), r1=152(y1), r2=324(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 152
LDI r2, 324
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
