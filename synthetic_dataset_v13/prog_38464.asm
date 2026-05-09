; DESCRIPTION: Draws a black line from (141, 55) to (90, 31).
; PLAN: r0=141(x1), r1=55(y1), r2=90(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 55
LDI r2, 90
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
