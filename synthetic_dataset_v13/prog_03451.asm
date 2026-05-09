; DESCRIPTION: Places a green line segment connecting (68, 100) to (333, 91).
; PLAN: r0=68(x1), r1=100(y1), r2=333(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 100
LDI r2, 333
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
