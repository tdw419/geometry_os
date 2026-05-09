; DESCRIPTION: Draws a cyan rectangle at (76, 143) with width 119 and height 14.
; PLAN: r0=76(x), r1=143(y), r2=119(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 143
LDI r2, 119
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
