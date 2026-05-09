; DESCRIPTION: Draws a black rectangle at (182, 206) with width 54 and height 39.
; PLAN: r0=182(x), r1=206(y), r2=54(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 206
LDI r2, 54
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
