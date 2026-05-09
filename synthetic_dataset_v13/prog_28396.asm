; DESCRIPTION: Places a green line segment connecting (341, 67) to (382, 47).
; PLAN: r0=341(x1), r1=67(y1), r2=382(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 67
LDI r2, 382
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
