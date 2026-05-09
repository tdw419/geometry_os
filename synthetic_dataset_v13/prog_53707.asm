; DESCRIPTION: Places a magenta line segment connecting (239, 64) to (369, 139).
; PLAN: r0=239(x1), r1=64(y1), r2=369(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 64
LDI r2, 369
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
