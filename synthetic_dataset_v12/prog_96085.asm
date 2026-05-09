; DESCRIPTION: Places a green line segment connecting (494, 151) to (67, 50).
; PLAN: r0=494(x1), r1=151(y1), r2=67(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 151
LDI r2, 67
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
