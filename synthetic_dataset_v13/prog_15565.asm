; DESCRIPTION: Places a black line segment connecting (293, 176) to (406, 103).
; PLAN: r0=293(x1), r1=176(y1), r2=406(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 176
LDI r2, 406
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
