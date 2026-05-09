; DESCRIPTION: Places a black line segment connecting (83, 209) to (492, 92).
; PLAN: r0=83(x1), r1=209(y1), r2=492(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 209
LDI r2, 492
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
