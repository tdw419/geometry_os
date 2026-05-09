; DESCRIPTION: Places a black line segment connecting (360, 67) to (92, 192).
; PLAN: r0=360(x1), r1=67(y1), r2=92(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 67
LDI r2, 92
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
