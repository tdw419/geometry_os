; DESCRIPTION: Draws a cyan rectangle at (176, 56) with width 52 and height 116.
; PLAN: r0=176(x), r1=56(y), r2=52(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 56
LDI r2, 52
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
