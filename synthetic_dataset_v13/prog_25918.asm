; DESCRIPTION: Draws a black line from (178, 143) to (153, 72).
; PLAN: r0=178(x1), r1=143(y1), r2=153(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 143
LDI r2, 153
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
