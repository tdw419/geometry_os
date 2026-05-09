; DESCRIPTION: Draws a yellow line from (168, 75) to (469, 194).
; PLAN: r0=168(x1), r1=75(y1), r2=469(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 75
LDI r2, 469
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
