; DESCRIPTION: Places a green line segment connecting (315, 188) to (340, 13).
; PLAN: r0=315(x1), r1=188(y1), r2=340(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 188
LDI r2, 340
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
