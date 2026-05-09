; DESCRIPTION: Draws a orange line from (376, 61) to (175, 228).
; PLAN: r0=376(x1), r1=61(y1), r2=175(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 61
LDI r2, 175
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
