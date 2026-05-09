; DESCRIPTION: Draws a orange line from (327, 171) to (62, 246).
; PLAN: r0=327(x1), r1=171(y1), r2=62(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 171
LDI r2, 62
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
