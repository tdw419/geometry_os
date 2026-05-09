; DESCRIPTION: Places a green line segment connecting (435, 243) to (97, 79).
; PLAN: r0=435(x1), r1=243(y1), r2=97(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 243
LDI r2, 97
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
