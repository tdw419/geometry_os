; DESCRIPTION: Renders a black line between points (327, 99) and (164, 62).
; PLAN: r0=327(x1), r1=99(y1), r2=164(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 99
LDI r2, 164
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
