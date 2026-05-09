; DESCRIPTION: Places a white line segment connecting (258, 162) to (305, 132).
; PLAN: r0=258(x1), r1=162(y1), r2=305(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 162
LDI r2, 305
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
