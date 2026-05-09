; DESCRIPTION: Draws a green line from (372, 43) to (465, 155).
; PLAN: r0=372(x1), r1=43(y1), r2=465(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 43
LDI r2, 465
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
