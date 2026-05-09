; DESCRIPTION: Places a blue line segment connecting (394, 210) to (438, 7).
; PLAN: r0=394(x1), r1=210(y1), r2=438(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 210
LDI r2, 438
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
