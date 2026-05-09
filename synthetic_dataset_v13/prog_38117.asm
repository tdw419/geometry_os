; DESCRIPTION: Places a yellow line segment connecting (359, 213) to (461, 253).
; PLAN: r0=359(x1), r1=213(y1), r2=461(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 213
LDI r2, 461
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
