; DESCRIPTION: Draws a white rectangle at (69, 57) with width 32 and height 29.
; PLAN: r0=69(x), r1=57(y), r2=32(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 57
LDI r2, 32
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
