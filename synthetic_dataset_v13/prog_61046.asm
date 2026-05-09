; DESCRIPTION: Draws a white rectangle at (425, 45) with width 69 and height 83.
; PLAN: r0=425(x), r1=45(y), r2=69(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 45
LDI r2, 69
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
