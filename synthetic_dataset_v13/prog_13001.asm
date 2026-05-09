; DESCRIPTION: Draws a red rectangle at (361, 131) with width 99 and height 23.
; PLAN: r0=361(x), r1=131(y), r2=99(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 131
LDI r2, 99
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
