; DESCRIPTION: Draws a black rectangle at (17, 103) with width 42 and height 52.
; PLAN: r0=17(x), r1=103(y), r2=42(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 103
LDI r2, 42
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
