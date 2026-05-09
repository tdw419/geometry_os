; DESCRIPTION: Places a blue line segment connecting (4, 167) to (215, 17).
; PLAN: r0=4(x1), r1=167(y1), r2=215(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 167
LDI r2, 215
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
