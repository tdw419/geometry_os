; DESCRIPTION: Places a purple line segment connecting (509, 245) to (387, 24).
; PLAN: r0=509(x1), r1=245(y1), r2=387(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 245
LDI r2, 387
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
