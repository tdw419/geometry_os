; DESCRIPTION: Draws a red rectangle at (168, 134) with width 116 and height 10.
; PLAN: r0=168(x), r1=134(y), r2=116(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 134
LDI r2, 116
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
