; DESCRIPTION: Places a blue line segment connecting (176, 115) to (257, 117).
; PLAN: r0=176(x1), r1=115(y1), r2=257(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 115
LDI r2, 257
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
