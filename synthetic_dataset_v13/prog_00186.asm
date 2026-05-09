; DESCRIPTION: Places a blue line segment connecting (60, 150) to (228, 116).
; PLAN: r0=60(x1), r1=150(y1), r2=228(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 150
LDI r2, 228
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
