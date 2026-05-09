; DESCRIPTION: Draws a black rectangle at (244, 61) with width 86 and height 57.
; PLAN: r0=244(x), r1=61(y), r2=86(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 61
LDI r2, 86
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
