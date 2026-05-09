; DESCRIPTION: Draws a black line from (60, 191) to (31, 44).
; PLAN: r0=60(x1), r1=191(y1), r2=31(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 191
LDI r2, 31
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
