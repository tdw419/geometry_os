; DESCRIPTION: Draws a red rectangle at (208, 62) with width 81 and height 70.
; PLAN: r0=208(x), r1=62(y), r2=81(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 62
LDI r2, 81
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
