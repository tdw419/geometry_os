; DESCRIPTION: Draws a black rectangle at (374, 4) with width 31 and height 34.
; PLAN: r0=374(x), r1=4(y), r2=31(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 4
LDI r2, 31
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
