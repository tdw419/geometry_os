; DESCRIPTION: Draws a white rectangle at (42, 0) with width 27 and height 63.
; PLAN: r0=42(x), r1=0(y), r2=27(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 0
LDI r2, 27
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
