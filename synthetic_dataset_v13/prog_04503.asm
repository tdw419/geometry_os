; DESCRIPTION: Draws a cyan rectangle at (205, 56) with width 116 and height 81.
; PLAN: r0=205(x), r1=56(y), r2=116(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 56
LDI r2, 116
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
