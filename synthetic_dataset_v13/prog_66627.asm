; DESCRIPTION: Places a black line segment connecting (500, 156) to (465, 103).
; PLAN: r0=500(x1), r1=156(y1), r2=465(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 156
LDI r2, 465
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
