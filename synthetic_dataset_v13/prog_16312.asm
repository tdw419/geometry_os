; DESCRIPTION: Draws a red rectangle at (356, 176) with width 32 and height 67.
; PLAN: r0=356(x), r1=176(y), r2=32(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 176
LDI r2, 32
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
