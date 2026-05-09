; DESCRIPTION: Places a blue line segment connecting (294, 63) to (90, 207).
; PLAN: r0=294(x1), r1=63(y1), r2=90(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 63
LDI r2, 90
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
