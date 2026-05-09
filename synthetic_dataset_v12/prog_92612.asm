; DESCRIPTION: Places a yellow line segment connecting (327, 244) to (67, 182).
; PLAN: r0=327(x1), r1=244(y1), r2=67(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 244
LDI r2, 67
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
