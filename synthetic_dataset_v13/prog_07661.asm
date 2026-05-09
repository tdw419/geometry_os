; DESCRIPTION: Draws a black rectangle at (126, 149) with width 85 and height 84.
; PLAN: r0=126(x), r1=149(y), r2=85(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 149
LDI r2, 85
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
