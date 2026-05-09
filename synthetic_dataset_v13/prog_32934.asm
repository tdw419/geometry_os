; DESCRIPTION: Places a black line segment connecting (235, 240) to (124, 96).
; PLAN: r0=235(x1), r1=240(y1), r2=124(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 240
LDI r2, 124
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
