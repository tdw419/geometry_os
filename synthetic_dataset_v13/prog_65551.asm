; DESCRIPTION: Places a black line segment connecting (160, 171) to (152, 153).
; PLAN: r0=160(x1), r1=171(y1), r2=152(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 171
LDI r2, 152
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
