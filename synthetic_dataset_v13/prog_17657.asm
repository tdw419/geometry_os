; DESCRIPTION: Places a blue line segment connecting (246, 205) to (421, 139).
; PLAN: r0=246(x1), r1=205(y1), r2=421(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 205
LDI r2, 421
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
