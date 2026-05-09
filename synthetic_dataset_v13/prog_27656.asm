; DESCRIPTION: Draws a red rectangle at (179, 70) with width 17 and height 49.
; PLAN: r0=179(x), r1=70(y), r2=17(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 70
LDI r2, 17
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
