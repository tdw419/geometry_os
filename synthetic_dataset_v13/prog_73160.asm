; DESCRIPTION: Draws a black line from (444, 151) to (240, 249).
; PLAN: r0=444(x1), r1=151(y1), r2=240(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 151
LDI r2, 240
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
