; DESCRIPTION: Places a purple line segment connecting (294, 206) to (411, 12).
; PLAN: r0=294(x1), r1=206(y1), r2=411(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 206
LDI r2, 411
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
