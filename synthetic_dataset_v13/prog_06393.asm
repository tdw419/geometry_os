; DESCRIPTION: Draws a orange line from (477, 249) to (377, 228).
; PLAN: r0=477(x1), r1=249(y1), r2=377(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 249
LDI r2, 377
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
