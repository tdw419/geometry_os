; DESCRIPTION: Places a green line segment connecting (60, 234) to (374, 9).
; PLAN: r0=60(x1), r1=234(y1), r2=374(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 234
LDI r2, 374
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
