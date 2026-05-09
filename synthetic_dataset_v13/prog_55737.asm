; DESCRIPTION: Draws a black rectangle at (154, 27) with width 83 and height 115.
; PLAN: r0=154(x), r1=27(y), r2=83(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 27
LDI r2, 83
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
