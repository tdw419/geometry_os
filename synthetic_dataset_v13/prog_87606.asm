; DESCRIPTION: Places a black line segment connecting (405, 244) to (103, 153).
; PLAN: r0=405(x1), r1=244(y1), r2=103(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 244
LDI r2, 103
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
