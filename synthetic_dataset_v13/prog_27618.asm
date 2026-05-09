; DESCRIPTION: Places a black line segment connecting (503, 71) to (111, 73).
; PLAN: r0=503(x1), r1=71(y1), r2=111(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 71
LDI r2, 111
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
