; DESCRIPTION: Draws a black line from (421, 16) to (444, 148).
; PLAN: r0=421(x1), r1=16(y1), r2=444(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 16
LDI r2, 444
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
