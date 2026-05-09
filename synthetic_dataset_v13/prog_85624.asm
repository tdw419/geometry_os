; DESCRIPTION: Places a yellow line segment connecting (326, 11) to (61, 215).
; PLAN: r0=326(x1), r1=11(y1), r2=61(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 11
LDI r2, 61
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
