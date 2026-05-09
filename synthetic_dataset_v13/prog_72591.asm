; DESCRIPTION: Places a blue line segment connecting (371, 123) to (298, 235).
; PLAN: r0=371(x1), r1=123(y1), r2=298(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 123
LDI r2, 298
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
