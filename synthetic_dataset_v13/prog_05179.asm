; DESCRIPTION: Places a black line segment connecting (47, 152) to (412, 187).
; PLAN: r0=47(x1), r1=152(y1), r2=412(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 152
LDI r2, 412
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
