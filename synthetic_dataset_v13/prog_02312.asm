; DESCRIPTION: Draws a black line from (6, 187) to (233, 195).
; PLAN: r0=6(x1), r1=187(y1), r2=233(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 187
LDI r2, 233
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
