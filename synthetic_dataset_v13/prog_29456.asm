; DESCRIPTION: Draws a red rectangle at (14, 96) with width 92 and height 32.
; PLAN: r0=14(x), r1=96(y), r2=92(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 96
LDI r2, 92
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
