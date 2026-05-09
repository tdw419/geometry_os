; DESCRIPTION: Draws a black rectangle at (157, 168) with width 86 and height 17.
; PLAN: r0=157(x), r1=168(y), r2=86(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 168
LDI r2, 86
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
