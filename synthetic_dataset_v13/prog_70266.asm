; DESCRIPTION: Draws a white rectangle at (375, 131) with width 65 and height 36.
; PLAN: r0=375(x), r1=131(y), r2=65(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 131
LDI r2, 65
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
