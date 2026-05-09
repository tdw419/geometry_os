; DESCRIPTION: Draws a black rectangle at (352, 42) with width 94 and height 38.
; PLAN: r0=352(x), r1=42(y), r2=94(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 42
LDI r2, 94
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
