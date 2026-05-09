; DESCRIPTION: Draws a white rectangle at (374, 58) with width 19 and height 18.
; PLAN: r0=374(x), r1=58(y), r2=19(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 58
LDI r2, 19
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
