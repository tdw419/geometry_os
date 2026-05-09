; DESCRIPTION: Places a black line segment connecting (500, 228) to (153, 224).
; PLAN: r0=500(x1), r1=228(y1), r2=153(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 228
LDI r2, 153
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
