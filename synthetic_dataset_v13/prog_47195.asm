; DESCRIPTION: Draws a yellow rectangle at (267, 138) with width 36 and height 42.
; PLAN: r0=267(x), r1=138(y), r2=36(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 138
LDI r2, 36
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
