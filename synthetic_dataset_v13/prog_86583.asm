; DESCRIPTION: Draws a cyan rectangle at (352, 11) with width 11 and height 116.
; PLAN: r0=352(x), r1=11(y), r2=11(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 11
LDI r2, 11
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
