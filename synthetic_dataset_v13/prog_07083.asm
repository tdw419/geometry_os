; DESCRIPTION: Places a green line segment connecting (350, 16) to (507, 25).
; PLAN: r0=350(x1), r1=16(y1), r2=507(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 16
LDI r2, 507
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
