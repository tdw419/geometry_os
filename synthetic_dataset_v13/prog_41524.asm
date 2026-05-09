; DESCRIPTION: Draws a black line from (168, 170) to (95, 189).
; PLAN: r0=168(x1), r1=170(y1), r2=95(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 170
LDI r2, 95
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
