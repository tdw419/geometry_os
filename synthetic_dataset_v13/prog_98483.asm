; DESCRIPTION: Draws a yellow rectangle at (213, 82) with width 32 and height 66.
; PLAN: r0=213(x), r1=82(y), r2=32(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 82
LDI r2, 32
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
