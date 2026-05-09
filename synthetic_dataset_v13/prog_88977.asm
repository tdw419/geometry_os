; DESCRIPTION: Places a yellow line segment connecting (371, 207) to (437, 16).
; PLAN: r0=371(x1), r1=207(y1), r2=437(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 207
LDI r2, 437
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
