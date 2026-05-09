; DESCRIPTION: Places a black line segment connecting (40, 80) to (69, 174).
; PLAN: r0=40(x1), r1=80(y1), r2=69(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 80
LDI r2, 69
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
