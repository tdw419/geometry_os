; DESCRIPTION: Draws a white rectangle at (275, 154) with width 56 and height 28.
; PLAN: r0=275(x), r1=154(y), r2=56(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 154
LDI r2, 56
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
