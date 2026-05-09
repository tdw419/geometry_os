; DESCRIPTION: Renders a orange line between points (384, 46) and (53, 207).
; PLAN: r0=384(x1), r1=46(y1), r2=53(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 46
LDI r2, 53
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
