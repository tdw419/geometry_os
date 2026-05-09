; DESCRIPTION: Draws a white rectangle at (397, 48) with width 65 and height 87.
; PLAN: r0=397(x), r1=48(y), r2=65(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 48
LDI r2, 65
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
