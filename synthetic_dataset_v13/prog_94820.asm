; DESCRIPTION: Draws a red line from (281, 62) to (282, 163).
; PLAN: r0=281(x1), r1=62(y1), r2=282(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 62
LDI r2, 282
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
