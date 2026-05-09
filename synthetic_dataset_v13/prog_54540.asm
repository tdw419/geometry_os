; DESCRIPTION: Draws a black rectangle at (299, 133) with width 32 and height 50.
; PLAN: r0=299(x), r1=133(y), r2=32(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 133
LDI r2, 32
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
