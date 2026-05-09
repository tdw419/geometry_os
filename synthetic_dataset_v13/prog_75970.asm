; DESCRIPTION: Places a white line segment connecting (198, 97) to (468, 97).
; PLAN: r0=198(x1), r1=97(y1), r2=468(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 97
LDI r2, 468
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
