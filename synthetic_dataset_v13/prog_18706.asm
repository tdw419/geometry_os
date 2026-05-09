; DESCRIPTION: Draws a yellow line from (282, 247) to (16, 28).
; PLAN: r0=282(x1), r1=247(y1), r2=16(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 247
LDI r2, 16
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
