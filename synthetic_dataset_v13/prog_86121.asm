; DESCRIPTION: Draws a white rectangle at (56, 5) with width 50 and height 33.
; PLAN: r0=56(x), r1=5(y), r2=50(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 5
LDI r2, 50
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
