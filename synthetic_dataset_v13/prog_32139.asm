; DESCRIPTION: Draws a orange line from (154, 128) to (19, 103).
; PLAN: r0=154(x1), r1=128(y1), r2=19(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 128
LDI r2, 19
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
