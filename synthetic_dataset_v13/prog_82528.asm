; DESCRIPTION: Draws a red rectangle at (8, 165) with width 64 and height 47.
; PLAN: r0=8(x), r1=165(y), r2=64(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 165
LDI r2, 64
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
