; DESCRIPTION: Draws a white rectangle at (268, 190) with width 108 and height 39.
; PLAN: r0=268(x), r1=190(y), r2=108(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 190
LDI r2, 108
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
