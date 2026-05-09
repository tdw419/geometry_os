; DESCRIPTION: Draws a white rectangle at (267, 42) with width 109 and height 62.
; PLAN: r0=267(x), r1=42(y), r2=109(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 42
LDI r2, 109
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
