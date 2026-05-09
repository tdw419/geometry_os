; DESCRIPTION: Places a black line segment connecting (39, 86) to (168, 129).
; PLAN: r0=39(x1), r1=86(y1), r2=168(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 86
LDI r2, 168
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
