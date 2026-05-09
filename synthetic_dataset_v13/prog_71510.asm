; DESCRIPTION: Places a black line segment connecting (2, 189) to (129, 228).
; PLAN: r0=2(x1), r1=189(y1), r2=129(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 189
LDI r2, 129
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
