; DESCRIPTION: Draws a black line from (153, 213) to (134, 35).
; PLAN: r0=153(x1), r1=213(y1), r2=134(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 213
LDI r2, 134
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
