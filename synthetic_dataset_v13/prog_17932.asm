; DESCRIPTION: Places a black line segment connecting (261, 111) to (148, 71).
; PLAN: r0=261(x1), r1=111(y1), r2=148(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 111
LDI r2, 148
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
