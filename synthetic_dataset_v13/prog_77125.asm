; DESCRIPTION: Draws a white rectangle at (294, 11) with width 78 and height 57.
; PLAN: r0=294(x), r1=11(y), r2=78(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 11
LDI r2, 78
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
