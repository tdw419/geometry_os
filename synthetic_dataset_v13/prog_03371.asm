; DESCRIPTION: Places a yellow line segment connecting (198, 23) to (372, 235).
; PLAN: r0=198(x1), r1=23(y1), r2=372(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 23
LDI r2, 372
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
