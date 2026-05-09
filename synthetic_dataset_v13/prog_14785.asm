; DESCRIPTION: Places a black line segment connecting (433, 101) to (465, 179).
; PLAN: r0=433(x1), r1=101(y1), r2=465(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 101
LDI r2, 465
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
