; DESCRIPTION: Draws a black line from (34, 170) to (27, 115).
; PLAN: r0=34(x1), r1=170(y1), r2=27(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 170
LDI r2, 27
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
