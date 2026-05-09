; DESCRIPTION: Places a purple line segment connecting (474, 210) to (305, 188).
; PLAN: r0=474(x1), r1=210(y1), r2=305(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 210
LDI r2, 305
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
