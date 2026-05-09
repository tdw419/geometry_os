; DESCRIPTION: Draws a cyan rectangle at (312, 113) with width 16 and height 112.
; PLAN: r0=312(x), r1=113(y), r2=16(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 113
LDI r2, 16
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
