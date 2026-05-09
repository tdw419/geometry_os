; DESCRIPTION: Draws a black rectangle at (374, 135) with width 24 and height 32.
; PLAN: r0=374(x), r1=135(y), r2=24(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 135
LDI r2, 24
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
