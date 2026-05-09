; DESCRIPTION: Draws a black rectangle at (329, 64) with width 47 and height 85.
; PLAN: r0=329(x), r1=64(y), r2=47(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 64
LDI r2, 47
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
