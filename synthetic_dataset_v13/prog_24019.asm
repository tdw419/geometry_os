; DESCRIPTION: Places a white line segment connecting (17, 222) to (438, 164).
; PLAN: r0=17(x1), r1=222(y1), r2=438(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 222
LDI r2, 438
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
