; DESCRIPTION: Draws a red rectangle at (300, 78) with width 71 and height 96.
; PLAN: r0=300(x), r1=78(y), r2=71(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 78
LDI r2, 71
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
