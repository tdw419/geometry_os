; DESCRIPTION: Places a black line segment connecting (160, 152) to (310, 153).
; PLAN: r0=160(x1), r1=152(y1), r2=310(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 152
LDI r2, 310
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
