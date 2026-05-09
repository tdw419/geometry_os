; DESCRIPTION: Draws a cyan rectangle at (203, 85) with width 50 and height 84.
; PLAN: r0=203(x), r1=85(y), r2=50(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 85
LDI r2, 50
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
