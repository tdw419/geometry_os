; DESCRIPTION: Draws a green rectangle at (315, 42) with width 82 and height 39.
; PLAN: r0=315(x), r1=42(y), r2=82(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 42
LDI r2, 82
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
