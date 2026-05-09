; DESCRIPTION: Draws a black line from (54, 16) to (207, 105).
; PLAN: r0=54(x1), r1=16(y1), r2=207(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 16
LDI r2, 207
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
