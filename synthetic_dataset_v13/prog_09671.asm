; DESCRIPTION: Draws a black line from (452, 255) to (98, 123).
; PLAN: r0=452(x1), r1=255(y1), r2=98(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 255
LDI r2, 98
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
