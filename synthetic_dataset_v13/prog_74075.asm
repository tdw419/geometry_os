; DESCRIPTION: Draws a red rectangle at (165, 106) with width 65 and height 109.
; PLAN: r0=165(x), r1=106(y), r2=65(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 106
LDI r2, 65
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
