; DESCRIPTION: Places a blue line segment connecting (30, 207) to (43, 215).
; PLAN: r0=30(x1), r1=207(y1), r2=43(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 207
LDI r2, 43
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
