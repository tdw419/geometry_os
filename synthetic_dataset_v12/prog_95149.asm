; DESCRIPTION: Draws a black rectangle at (327, 32) with width 31 and height 103.
; PLAN: r0=327(x), r1=32(y), r2=31(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 32
LDI r2, 31
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
