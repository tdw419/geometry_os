; DESCRIPTION: Places a black line segment connecting (274, 47) to (386, 134).
; PLAN: r0=274(x1), r1=47(y1), r2=386(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 47
LDI r2, 386
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
