; DESCRIPTION: Draws a cyan rectangle at (192, 184) with width 120 and height 15.
; PLAN: r0=192(x), r1=184(y), r2=120(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 184
LDI r2, 120
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
