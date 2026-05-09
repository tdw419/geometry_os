; DESCRIPTION: Places a blue line segment connecting (304, 232) to (509, 215).
; PLAN: r0=304(x1), r1=232(y1), r2=509(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 232
LDI r2, 509
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
