; DESCRIPTION: Draws a orange line from (262, 16) to (163, 198).
; PLAN: r0=262(x1), r1=16(y1), r2=163(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 16
LDI r2, 163
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
