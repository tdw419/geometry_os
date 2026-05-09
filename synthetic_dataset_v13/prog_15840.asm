; DESCRIPTION: Draws a black line from (281, 198) to (112, 115).
; PLAN: r0=281(x1), r1=198(y1), r2=112(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 198
LDI r2, 112
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
