; DESCRIPTION: Places a green line segment connecting (30, 205) to (291, 70).
; PLAN: r0=30(x1), r1=205(y1), r2=291(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 205
LDI r2, 291
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
