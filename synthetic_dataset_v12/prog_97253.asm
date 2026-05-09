; DESCRIPTION: Places a magenta line segment connecting (150, 139) to (336, 120).
; PLAN: r0=150(x1), r1=139(y1), r2=336(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 139
LDI r2, 336
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
