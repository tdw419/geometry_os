; DESCRIPTION: Draws a cyan rectangle at (141, 54) with width 96 and height 30.
; PLAN: r0=141(x), r1=54(y), r2=96(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 54
LDI r2, 96
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
