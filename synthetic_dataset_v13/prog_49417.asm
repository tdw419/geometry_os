; DESCRIPTION: Draws a black line from (291, 195) to (301, 170).
; PLAN: r0=291(x1), r1=195(y1), r2=301(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 195
LDI r2, 301
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
