; DESCRIPTION: Draws a red rectangle at (50, 126) with width 116 and height 18.
; PLAN: r0=50(x), r1=126(y), r2=116(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 126
LDI r2, 116
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
