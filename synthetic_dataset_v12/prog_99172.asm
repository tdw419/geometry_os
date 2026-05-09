; DESCRIPTION: Draws a red rectangle at (86, 74) with width 62 and height 54.
; PLAN: r0=86(x), r1=74(y), r2=62(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 74
LDI r2, 62
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
