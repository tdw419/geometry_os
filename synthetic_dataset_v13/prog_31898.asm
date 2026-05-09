; DESCRIPTION: Places a green line segment connecting (374, 15) to (504, 87).
; PLAN: r0=374(x1), r1=15(y1), r2=504(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 15
LDI r2, 504
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
