; DESCRIPTION: Places a black line segment connecting (269, 193) to (285, 230).
; PLAN: r0=269(x1), r1=193(y1), r2=285(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 193
LDI r2, 285
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
