; DESCRIPTION: Draws a black line from (194, 165) to (57, 40).
; PLAN: r0=194(x1), r1=165(y1), r2=57(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 165
LDI r2, 57
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
