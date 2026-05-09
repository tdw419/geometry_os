; DESCRIPTION: Draws a red rectangle at (196, 24) with width 62 and height 64.
; PLAN: r0=196(x), r1=24(y), r2=62(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 24
LDI r2, 62
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
