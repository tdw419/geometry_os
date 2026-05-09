; DESCRIPTION: Draws a black line from (196, 78) to (411, 192).
; PLAN: r0=196(x1), r1=78(y1), r2=411(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 78
LDI r2, 411
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
