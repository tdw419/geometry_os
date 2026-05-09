; DESCRIPTION: Places a white line segment connecting (198, 61) to (412, 26).
; PLAN: r0=198(x1), r1=61(y1), r2=412(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 61
LDI r2, 412
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
