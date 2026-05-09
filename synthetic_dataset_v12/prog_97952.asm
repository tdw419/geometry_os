; DESCRIPTION: Draws a red rectangle at (193, 69) with width 116 and height 64.
; PLAN: r0=193(x), r1=69(y), r2=116(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 69
LDI r2, 116
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
