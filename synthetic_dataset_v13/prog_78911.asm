; DESCRIPTION: Draws a white rectangle at (42, 137) with width 76 and height 99.
; PLAN: r0=42(x), r1=137(y), r2=76(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 137
LDI r2, 76
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
