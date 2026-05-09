; DESCRIPTION: Places a green line segment connecting (97, 3) to (435, 164).
; PLAN: r0=97(x1), r1=3(y1), r2=435(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 3
LDI r2, 435
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
