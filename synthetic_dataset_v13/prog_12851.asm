; DESCRIPTION: Draws a black line from (122, 31) to (408, 107).
; PLAN: r0=122(x1), r1=31(y1), r2=408(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 31
LDI r2, 408
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
