; DESCRIPTION: Places a black line segment connecting (131, 235) to (371, 50).
; PLAN: r0=131(x1), r1=235(y1), r2=371(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 235
LDI r2, 371
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
