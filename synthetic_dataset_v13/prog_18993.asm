; DESCRIPTION: Draws a black rectangle at (479, 6) with width 32 and height 60.
; PLAN: r0=479(x), r1=6(y), r2=32(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 6
LDI r2, 32
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
