; DESCRIPTION: Draws a orange line from (197, 32) to (262, 24).
; PLAN: r0=197(x1), r1=32(y1), r2=262(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 32
LDI r2, 262
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
