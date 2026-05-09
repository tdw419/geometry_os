; DESCRIPTION: Places a purple line segment connecting (61, 43) to (386, 134).
; PLAN: r0=61(x1), r1=43(y1), r2=386(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 43
LDI r2, 386
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
