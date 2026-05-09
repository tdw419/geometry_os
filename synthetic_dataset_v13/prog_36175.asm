; DESCRIPTION: Draws a white rectangle at (52, 45) with width 32 and height 45.
; PLAN: r0=52(x), r1=45(y), r2=32(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 45
LDI r2, 32
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
