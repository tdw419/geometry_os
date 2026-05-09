; DESCRIPTION: Draws a white rectangle at (245, 25) with width 18 and height 76.
; PLAN: r0=245(x), r1=25(y), r2=18(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 25
LDI r2, 18
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
