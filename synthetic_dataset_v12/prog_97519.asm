; DESCRIPTION: Draws a yellow line from (102, 115) to (361, 50).
; PLAN: r0=102(x1), r1=115(y1), r2=361(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 115
LDI r2, 361
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
