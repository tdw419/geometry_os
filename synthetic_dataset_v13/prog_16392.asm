; DESCRIPTION: Places a green line segment connecting (67, 92) to (46, 93).
; PLAN: r0=67(x1), r1=92(y1), r2=46(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 92
LDI r2, 46
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
