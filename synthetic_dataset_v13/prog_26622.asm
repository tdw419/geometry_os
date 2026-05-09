; DESCRIPTION: Places a black line segment connecting (372, 15) to (509, 231).
; PLAN: r0=372(x1), r1=15(y1), r2=509(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 15
LDI r2, 509
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
