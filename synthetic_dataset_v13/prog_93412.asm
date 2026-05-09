; DESCRIPTION: Draws a cyan rectangle at (222, 64) with width 24 and height 81.
; PLAN: r0=222(x), r1=64(y), r2=24(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 64
LDI r2, 24
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
