; DESCRIPTION: Places a black line segment connecting (406, 173) to (77, 250).
; PLAN: r0=406(x1), r1=173(y1), r2=77(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 173
LDI r2, 77
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
