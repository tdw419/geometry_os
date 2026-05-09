; DESCRIPTION: Draws a red rectangle at (145, 154) with width 43 and height 32.
; PLAN: r0=145(x), r1=154(y), r2=43(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 154
LDI r2, 43
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
