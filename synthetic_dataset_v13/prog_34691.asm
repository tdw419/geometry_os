; DESCRIPTION: Draws a cyan rectangle at (395, 123) with width 32 and height 81.
; PLAN: r0=395(x), r1=123(y), r2=32(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 123
LDI r2, 32
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
