; DESCRIPTION: Draws a white rectangle at (374, 85) with width 11 and height 102.
; PLAN: r0=374(x), r1=85(y), r2=11(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 85
LDI r2, 11
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
