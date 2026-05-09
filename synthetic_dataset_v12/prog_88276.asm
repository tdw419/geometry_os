; DESCRIPTION: Draws a red rectangle at (95, 146) with width 102 and height 81.
; PLAN: r0=95(x), r1=146(y), r2=102(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 146
LDI r2, 102
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
