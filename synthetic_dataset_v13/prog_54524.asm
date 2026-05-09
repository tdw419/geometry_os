; DESCRIPTION: Draws a black line from (22, 195) to (213, 33).
; PLAN: r0=22(x1), r1=195(y1), r2=213(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 195
LDI r2, 213
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
