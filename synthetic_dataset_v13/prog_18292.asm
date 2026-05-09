; DESCRIPTION: Places a black line segment connecting (152, 194) to (125, 34).
; PLAN: r0=152(x1), r1=194(y1), r2=125(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 194
LDI r2, 125
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
