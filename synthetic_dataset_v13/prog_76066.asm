; DESCRIPTION: Draws a red rectangle at (9, 142) with width 68 and height 68.
; PLAN: r0=9(x), r1=142(y), r2=68(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 142
LDI r2, 68
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
