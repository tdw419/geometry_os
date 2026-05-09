; DESCRIPTION: Draws a red rectangle at (92, 96) with width 100 and height 113.
; PLAN: r0=92(x), r1=96(y), r2=100(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 96
LDI r2, 100
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
