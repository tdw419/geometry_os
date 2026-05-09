; DESCRIPTION: Draws a white rectangle at (128, 44) with width 28 and height 39.
; PLAN: r0=128(x), r1=44(y), r2=28(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 44
LDI r2, 28
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
