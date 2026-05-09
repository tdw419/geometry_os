; DESCRIPTION: Places a green line segment connecting (19, 64) to (384, 252).
; PLAN: r0=19(x1), r1=64(y1), r2=384(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 64
LDI r2, 384
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
