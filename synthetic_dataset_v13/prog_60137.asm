; DESCRIPTION: Places a green line segment connecting (153, 25) to (176, 179).
; PLAN: r0=153(x1), r1=25(y1), r2=176(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 25
LDI r2, 176
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
