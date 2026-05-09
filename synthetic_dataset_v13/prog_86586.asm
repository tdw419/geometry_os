; DESCRIPTION: Draws a white rectangle at (354, 98) with width 50 and height 30.
; PLAN: r0=354(x), r1=98(y), r2=50(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 98
LDI r2, 50
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
