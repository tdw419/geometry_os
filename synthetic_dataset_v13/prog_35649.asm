; DESCRIPTION: Draws a white rectangle at (103, 42) with width 14 and height 96.
; PLAN: r0=103(x), r1=42(y), r2=14(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 42
LDI r2, 14
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
