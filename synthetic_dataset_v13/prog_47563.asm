; DESCRIPTION: Places a green line segment connecting (43, 2) to (409, 27).
; PLAN: r0=43(x1), r1=2(y1), r2=409(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 2
LDI r2, 409
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
