; DESCRIPTION: Places a blue line segment connecting (420, 80) to (509, 134).
; PLAN: r0=420(x1), r1=80(y1), r2=509(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 80
LDI r2, 509
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
