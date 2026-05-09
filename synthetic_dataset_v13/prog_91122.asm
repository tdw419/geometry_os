; DESCRIPTION: Draws a black rectangle at (239, 187) with width 32 and height 35.
; PLAN: r0=239(x), r1=187(y), r2=32(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 187
LDI r2, 32
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
