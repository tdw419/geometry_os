; DESCRIPTION: Places a green line segment connecting (263, 0) to (326, 198).
; PLAN: r0=263(x1), r1=0(y1), r2=326(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 0
LDI r2, 326
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
