; DESCRIPTION: Places a magenta line segment connecting (173, 139) to (22, 38).
; PLAN: r0=173(x1), r1=139(y1), r2=22(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 139
LDI r2, 22
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
