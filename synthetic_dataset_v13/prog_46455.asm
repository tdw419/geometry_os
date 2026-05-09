; DESCRIPTION: Draws a black rectangle at (60, 143) with width 50 and height 78.
; PLAN: r0=60(x), r1=143(y), r2=50(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 143
LDI r2, 50
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
