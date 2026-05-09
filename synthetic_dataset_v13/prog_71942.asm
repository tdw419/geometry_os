; DESCRIPTION: Draws a cyan rectangle at (203, 96) with width 71 and height 64.
; PLAN: r0=203(x), r1=96(y), r2=71(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 96
LDI r2, 71
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
