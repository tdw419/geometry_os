; DESCRIPTION: Places a yellow line segment connecting (160, 179) to (398, 212).
; PLAN: r0=160(x1), r1=179(y1), r2=398(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 179
LDI r2, 398
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
