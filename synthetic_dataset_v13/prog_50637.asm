; DESCRIPTION: Draws a black line from (225, 23) to (11, 77).
; PLAN: r0=225(x1), r1=23(y1), r2=11(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 23
LDI r2, 11
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
