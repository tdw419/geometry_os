; DESCRIPTION: Draws a black line from (52, 183) to (381, 29).
; PLAN: r0=52(x1), r1=183(y1), r2=381(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 183
LDI r2, 381
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
