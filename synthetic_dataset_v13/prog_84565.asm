; DESCRIPTION: Draws a orange line from (168, 206) to (509, 115).
; PLAN: r0=168(x1), r1=206(y1), r2=509(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 206
LDI r2, 509
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
