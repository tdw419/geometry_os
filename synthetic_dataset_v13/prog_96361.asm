; DESCRIPTION: Draws a white rectangle at (374, 84) with width 61 and height 64.
; PLAN: r0=374(x), r1=84(y), r2=61(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 84
LDI r2, 61
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
