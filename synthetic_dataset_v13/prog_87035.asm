; DESCRIPTION: Draws a yellow line from (321, 49) to (491, 166).
; PLAN: r0=321(x1), r1=49(y1), r2=491(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 49
LDI r2, 491
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
