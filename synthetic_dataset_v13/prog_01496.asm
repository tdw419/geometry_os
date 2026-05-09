; DESCRIPTION: Places a white line segment connecting (330, 65) to (97, 20).
; PLAN: r0=330(x1), r1=65(y1), r2=97(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 65
LDI r2, 97
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
