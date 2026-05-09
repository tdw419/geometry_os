; DESCRIPTION: Draws a cyan rectangle at (341, 112) with width 88 and height 62.
; PLAN: r0=341(x), r1=112(y), r2=88(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 112
LDI r2, 88
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
