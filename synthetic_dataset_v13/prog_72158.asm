; DESCRIPTION: Draws a black line from (122, 49) to (480, 144).
; PLAN: r0=122(x1), r1=49(y1), r2=480(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 49
LDI r2, 480
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
