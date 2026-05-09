; DESCRIPTION: Places a black line segment connecting (57, 33) to (313, 134).
; PLAN: r0=57(x1), r1=33(y1), r2=313(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 33
LDI r2, 313
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
