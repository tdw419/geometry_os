; DESCRIPTION: Draws a black line from (43, 244) to (9, 13).
; PLAN: r0=43(x1), r1=244(y1), r2=9(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 244
LDI r2, 9
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
