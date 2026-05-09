; DESCRIPTION: Draws a red rectangle at (206, 61) with width 26 and height 118.
; PLAN: r0=206(x), r1=61(y), r2=26(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 61
LDI r2, 26
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
