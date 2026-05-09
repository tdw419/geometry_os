; DESCRIPTION: Draws a cyan rectangle at (184, 87) with width 72 and height 13.
; PLAN: r0=184(x), r1=87(y), r2=72(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 87
LDI r2, 72
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
