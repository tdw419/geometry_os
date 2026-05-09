; DESCRIPTION: Places a green line segment connecting (79, 43) to (11, 164).
; PLAN: r0=79(x1), r1=43(y1), r2=11(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 43
LDI r2, 11
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
