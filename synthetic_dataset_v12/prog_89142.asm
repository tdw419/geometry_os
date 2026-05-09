; DESCRIPTION: Draws a black line from (475, 210) to (98, 145).
; PLAN: r0=475(x1), r1=210(y1), r2=98(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 210
LDI r2, 98
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
