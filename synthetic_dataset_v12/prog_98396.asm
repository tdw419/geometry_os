; DESCRIPTION: Draws a cyan rectangle at (219, 13) with width 85 and height 55.
; PLAN: r0=219(x), r1=13(y), r2=85(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 13
LDI r2, 85
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
