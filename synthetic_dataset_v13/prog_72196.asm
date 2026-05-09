; DESCRIPTION: Draws a yellow line from (462, 73) to (98, 184).
; PLAN: r0=462(x1), r1=73(y1), r2=98(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 73
LDI r2, 98
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
