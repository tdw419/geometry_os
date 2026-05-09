; DESCRIPTION: Places a black line segment connecting (79, 16) to (3, 178).
; PLAN: r0=79(x1), r1=16(y1), r2=3(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 16
LDI r2, 3
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
