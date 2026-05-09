; DESCRIPTION: Draws a green rectangle at (25, 205) with width 82 and height 28.
; PLAN: r0=25(x), r1=205(y), r2=82(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 205
LDI r2, 82
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
