; DESCRIPTION: Places a black line segment connecting (132, 20) to (274, 152).
; PLAN: r0=132(x1), r1=20(y1), r2=274(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 20
LDI r2, 274
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
