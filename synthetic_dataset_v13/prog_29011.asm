; DESCRIPTION: Draws a yellow line from (184, 18) to (82, 135).
; PLAN: r0=184(x1), r1=18(y1), r2=82(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 18
LDI r2, 82
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
