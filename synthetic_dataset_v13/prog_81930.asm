; DESCRIPTION: Draws a black line from (54, 6) to (307, 121).
; PLAN: r0=54(x1), r1=6(y1), r2=307(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 6
LDI r2, 307
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
