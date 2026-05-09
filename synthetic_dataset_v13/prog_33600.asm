; DESCRIPTION: Places a black line segment connecting (125, 30) to (383, 174).
; PLAN: r0=125(x1), r1=30(y1), r2=383(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 30
LDI r2, 383
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
