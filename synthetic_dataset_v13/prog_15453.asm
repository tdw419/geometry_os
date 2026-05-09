; DESCRIPTION: Draws a black line from (9, 108) to (498, 195).
; PLAN: r0=9(x1), r1=108(y1), r2=498(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 108
LDI r2, 498
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
