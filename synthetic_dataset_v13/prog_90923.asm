; DESCRIPTION: Draws a black line from (75, 86) to (426, 38).
; PLAN: r0=75(x1), r1=86(y1), r2=426(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 86
LDI r2, 426
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
