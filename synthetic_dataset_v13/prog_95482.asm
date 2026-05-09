; DESCRIPTION: Places a black line segment connecting (349, 205) to (44, 164).
; PLAN: r0=349(x1), r1=205(y1), r2=44(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 205
LDI r2, 44
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
