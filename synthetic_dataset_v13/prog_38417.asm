; DESCRIPTION: Draws a yellow line from (172, 82) to (99, 249).
; PLAN: r0=172(x1), r1=82(y1), r2=99(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 82
LDI r2, 99
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
