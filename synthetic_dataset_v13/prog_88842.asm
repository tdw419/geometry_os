; DESCRIPTION: Draws a red rectangle at (168, 61) with width 47 and height 118.
; PLAN: r0=168(x), r1=61(y), r2=47(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 61
LDI r2, 47
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
