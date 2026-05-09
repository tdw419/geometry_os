; DESCRIPTION: Draws a black line from (197, 81) to (339, 39).
; PLAN: r0=197(x1), r1=81(y1), r2=339(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 81
LDI r2, 339
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
