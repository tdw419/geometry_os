; DESCRIPTION: Draws a white rectangle at (126, 42) with width 27 and height 73.
; PLAN: r0=126(x), r1=42(y), r2=27(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 42
LDI r2, 27
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
