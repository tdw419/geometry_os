; DESCRIPTION: Places a black line segment connecting (49, 231) to (371, 235).
; PLAN: r0=49(x1), r1=231(y1), r2=371(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 231
LDI r2, 371
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
