; DESCRIPTION: Draws a white rectangle at (452, 3) with width 45 and height 56.
; PLAN: r0=452(x), r1=3(y), r2=45(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 3
LDI r2, 45
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
