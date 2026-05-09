; DESCRIPTION: Draws a black line from (480, 78) to (166, 159).
; PLAN: r0=480(x1), r1=78(y1), r2=166(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 78
LDI r2, 166
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
