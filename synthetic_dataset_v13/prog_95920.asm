; DESCRIPTION: Draws a cyan rectangle at (339, 83) with width 116 and height 91.
; PLAN: r0=339(x), r1=83(y), r2=116(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 83
LDI r2, 116
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
