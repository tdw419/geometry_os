; DESCRIPTION: Places a black line segment connecting (482, 148) to (392, 102).
; PLAN: r0=482(x1), r1=148(y1), r2=392(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 148
LDI r2, 392
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
