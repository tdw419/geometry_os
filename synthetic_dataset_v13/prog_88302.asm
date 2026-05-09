; DESCRIPTION: Draws a cyan rectangle at (119, 167) with width 72 and height 28.
; PLAN: r0=119(x), r1=167(y), r2=72(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 167
LDI r2, 72
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
