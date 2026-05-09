; DESCRIPTION: Renders a yellow line between points (254, 94) and (383, 199).
; PLAN: r0=254(x1), r1=94(y1), r2=383(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 94
LDI r2, 383
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
