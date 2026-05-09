; DESCRIPTION: Draws a green rectangle at (342, 39) with width 55 and height 90.
; PLAN: r0=342(x), r1=39(y), r2=55(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 39
LDI r2, 55
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
