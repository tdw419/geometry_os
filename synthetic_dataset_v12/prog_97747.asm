; DESCRIPTION: Draws a red rectangle at (183, 71) with width 63 and height 72.
; PLAN: r0=183(x), r1=71(y), r2=63(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 71
LDI r2, 63
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
