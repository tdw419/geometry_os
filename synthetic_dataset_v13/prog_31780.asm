; DESCRIPTION: Places a blue line segment connecting (242, 229) to (134, 162).
; PLAN: r0=242(x1), r1=229(y1), r2=134(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 229
LDI r2, 134
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
