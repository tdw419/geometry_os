; DESCRIPTION: Draws a yellow line from (161, 65) to (376, 18).
; PLAN: r0=161(x1), r1=65(y1), r2=376(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 65
LDI r2, 376
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
