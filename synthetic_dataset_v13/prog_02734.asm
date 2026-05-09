; DESCRIPTION: Draws a black rectangle at (423, 73) with width 14 and height 32.
; PLAN: r0=423(x), r1=73(y), r2=14(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 73
LDI r2, 14
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
