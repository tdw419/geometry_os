; DESCRIPTION: Places a green line segment connecting (15, 84) to (335, 215).
; PLAN: r0=15(x1), r1=84(y1), r2=335(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 84
LDI r2, 335
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
