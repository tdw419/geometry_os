; DESCRIPTION: Draws a white rectangle at (2, 2) with width 32 and height 85.
; PLAN: r0=2(x), r1=2(y), r2=32(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 2
LDI r2, 32
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
