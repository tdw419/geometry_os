; DESCRIPTION: Draws a black rectangle at (42, 153) with width 85 and height 73.
; PLAN: r0=42(x), r1=153(y), r2=85(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 153
LDI r2, 85
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
