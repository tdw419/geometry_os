; DESCRIPTION: Draws a red rectangle at (176, 55) with width 103 and height 96.
; PLAN: r0=176(x), r1=55(y), r2=103(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 55
LDI r2, 103
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
