; DESCRIPTION: Places a cyan line segment connecting (472, 148) to (393, 153).
; PLAN: r0=472(x1), r1=148(y1), r2=393(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 148
LDI r2, 393
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
