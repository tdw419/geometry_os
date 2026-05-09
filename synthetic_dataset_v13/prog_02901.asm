; DESCRIPTION: Places a green line segment connecting (13, 178) to (21, 124).
; PLAN: r0=13(x1), r1=178(y1), r2=21(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 178
LDI r2, 21
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
