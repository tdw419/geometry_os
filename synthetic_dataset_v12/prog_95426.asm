; DESCRIPTION: Draws a cyan rectangle at (296, 34) with width 101 and height 72.
; PLAN: r0=296(x), r1=34(y), r2=101(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 34
LDI r2, 101
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
