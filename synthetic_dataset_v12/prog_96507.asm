; DESCRIPTION: Places a black line segment connecting (437, 206) to (189, 171).
; PLAN: r0=437(x1), r1=206(y1), r2=189(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 206
LDI r2, 189
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
