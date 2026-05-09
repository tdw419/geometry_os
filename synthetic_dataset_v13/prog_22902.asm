; DESCRIPTION: Places a black line segment connecting (183, 209) to (468, 164).
; PLAN: r0=183(x1), r1=209(y1), r2=468(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 209
LDI r2, 468
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
