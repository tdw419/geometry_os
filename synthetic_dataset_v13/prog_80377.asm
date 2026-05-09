; DESCRIPTION: Places a black line segment connecting (224, 217) to (293, 33).
; PLAN: r0=224(x1), r1=217(y1), r2=293(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 217
LDI r2, 293
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
