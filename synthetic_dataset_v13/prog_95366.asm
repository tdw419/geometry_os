; DESCRIPTION: Places a yellow line segment connecting (371, 214) to (468, 214).
; PLAN: r0=371(x1), r1=214(y1), r2=468(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 214
LDI r2, 468
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
