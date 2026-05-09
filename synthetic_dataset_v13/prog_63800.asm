; DESCRIPTION: Draws a cyan rectangle at (52, 101) with width 52 and height 113.
; PLAN: r0=52(x), r1=101(y), r2=52(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 101
LDI r2, 52
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
