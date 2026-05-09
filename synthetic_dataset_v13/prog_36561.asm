; DESCRIPTION: Draws a red rectangle at (179, 62) with width 59 and height 34.
; PLAN: r0=179(x), r1=62(y), r2=59(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 62
LDI r2, 59
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
