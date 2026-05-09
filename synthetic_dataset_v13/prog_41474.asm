; DESCRIPTION: Draws a cyan rectangle at (173, 101) with width 96 and height 34.
; PLAN: r0=173(x), r1=101(y), r2=96(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 101
LDI r2, 96
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
