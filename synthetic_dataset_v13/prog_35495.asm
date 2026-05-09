; DESCRIPTION: Places a black line segment connecting (159, 126) to (428, 164).
; PLAN: r0=159(x1), r1=126(y1), r2=428(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 126
LDI r2, 428
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
