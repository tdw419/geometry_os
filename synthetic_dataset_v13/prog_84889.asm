; DESCRIPTION: Draws a cyan rectangle at (203, 38) with width 108 and height 85.
; PLAN: r0=203(x), r1=38(y), r2=108(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 38
LDI r2, 108
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
