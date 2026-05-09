; DESCRIPTION: Draws a red rectangle at (222, 93) with width 13 and height 36.
; PLAN: r0=222(x), r1=93(y), r2=13(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 93
LDI r2, 13
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
