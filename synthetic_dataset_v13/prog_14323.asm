; DESCRIPTION: Draws a orange line from (354, 138) to (137, 42).
; PLAN: r0=354(x1), r1=138(y1), r2=137(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 138
LDI r2, 137
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
