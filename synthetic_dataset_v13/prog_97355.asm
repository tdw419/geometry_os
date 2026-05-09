; DESCRIPTION: Places a yellow line segment connecting (374, 210) to (20, 76).
; PLAN: r0=374(x1), r1=210(y1), r2=20(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 210
LDI r2, 20
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
