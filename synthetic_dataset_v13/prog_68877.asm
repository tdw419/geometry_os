; DESCRIPTION: Draws a green rectangle at (305, 143) with width 53 and height 69.
; PLAN: r0=305(x), r1=143(y), r2=53(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 143
LDI r2, 53
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
