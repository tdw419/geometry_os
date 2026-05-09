; DESCRIPTION: Places a green line segment connecting (263, 67) to (109, 8).
; PLAN: r0=263(x1), r1=67(y1), r2=109(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 67
LDI r2, 109
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
