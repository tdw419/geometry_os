; DESCRIPTION: Places a black line segment connecting (246, 67) to (209, 232).
; PLAN: r0=246(x1), r1=67(y1), r2=209(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 67
LDI r2, 209
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
