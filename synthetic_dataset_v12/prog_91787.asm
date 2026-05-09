; DESCRIPTION: Places a black line segment connecting (176, 213) to (421, 62).
; PLAN: r0=176(x1), r1=213(y1), r2=421(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 213
LDI r2, 421
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
