; DESCRIPTION: Draws a black line from (104, 114) to (343, 193).
; PLAN: r0=104(x1), r1=114(y1), r2=343(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 114
LDI r2, 343
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
