; DESCRIPTION: Places a orange line segment connecting (19, 151) to (333, 253).
; PLAN: r0=19(x1), r1=151(y1), r2=333(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 151
LDI r2, 333
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
