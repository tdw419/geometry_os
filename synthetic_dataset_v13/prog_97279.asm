; DESCRIPTION: Draws a white rectangle at (153, 101) with width 42 and height 105.
; PLAN: r0=153(x), r1=101(y), r2=42(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 101
LDI r2, 42
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
