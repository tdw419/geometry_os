; DESCRIPTION: Places a white line segment connecting (196, 67) to (157, 189).
; PLAN: r0=196(x1), r1=67(y1), r2=157(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 67
LDI r2, 157
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
