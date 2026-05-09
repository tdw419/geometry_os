; DESCRIPTION: Draws a black rectangle at (228, 178) with width 64 and height 57.
; PLAN: r0=228(x), r1=178(y), r2=64(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 178
LDI r2, 64
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
