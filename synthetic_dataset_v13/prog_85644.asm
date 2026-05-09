; DESCRIPTION: Draws a cyan rectangle at (288, 10) with width 24 and height 116.
; PLAN: r0=288(x), r1=10(y), r2=24(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 10
LDI r2, 24
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
