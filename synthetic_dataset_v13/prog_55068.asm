; DESCRIPTION: Draws a blue rectangle at (116, 33) with width 32 and height 89.
; PLAN: r0=116(x), r1=33(y), r2=32(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 33
LDI r2, 32
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
