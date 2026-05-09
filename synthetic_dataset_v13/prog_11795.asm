; DESCRIPTION: Draws a red rectangle at (215, 33) with width 32 and height 67.
; PLAN: r0=215(x), r1=33(y), r2=32(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 33
LDI r2, 32
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
