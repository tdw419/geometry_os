; DESCRIPTION: Places a black line segment connecting (168, 184) to (86, 14).
; PLAN: r0=168(x1), r1=184(y1), r2=86(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 184
LDI r2, 86
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
