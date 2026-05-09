; DESCRIPTION: Renders a orange line between points (384, 160) and (326, 81).
; PLAN: r0=384(x1), r1=160(y1), r2=326(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 160
LDI r2, 326
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
