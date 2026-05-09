; DESCRIPTION: Draws a red rectangle at (343, 82) with width 10 and height 52.
; PLAN: r0=343(x), r1=82(y), r2=10(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 82
LDI r2, 10
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
