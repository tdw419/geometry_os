; DESCRIPTION: Places a magenta line segment connecting (32, 139) to (113, 178).
; PLAN: r0=32(x1), r1=139(y1), r2=113(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 139
LDI r2, 113
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
