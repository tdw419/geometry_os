; DESCRIPTION: Draws a red rectangle at (301, 131) with width 61 and height 120.
; PLAN: r0=301(x), r1=131(y), r2=61(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 131
LDI r2, 61
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
