; DESCRIPTION: Draws a yellow rectangle at (268, 49) with width 107 and height 70.
; PLAN: r0=268(x), r1=49(y), r2=107(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 49
LDI r2, 107
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
