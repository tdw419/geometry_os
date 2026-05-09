; DESCRIPTION: Draws a black rectangle at (198, 128) with width 85 and height 114.
; PLAN: r0=198(x), r1=128(y), r2=85(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 128
LDI r2, 85
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
