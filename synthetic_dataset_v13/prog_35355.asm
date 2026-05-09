; DESCRIPTION: Draws a cyan rectangle at (254, 137) with width 113 and height 113.
; PLAN: r0=254(x), r1=137(y), r2=113(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 137
LDI r2, 113
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
