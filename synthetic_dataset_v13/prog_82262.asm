; DESCRIPTION: Draws a black line from (296, 114) to (354, 175).
; PLAN: r0=296(x1), r1=114(y1), r2=354(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 114
LDI r2, 354
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
