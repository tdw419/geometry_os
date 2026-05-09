; DESCRIPTION: Draws a red rectangle at (123, 8) with width 34 and height 24.
; PLAN: r0=123(x), r1=8(y), r2=34(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 8
LDI r2, 34
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
