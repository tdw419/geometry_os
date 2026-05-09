; DESCRIPTION: Draws a cyan rectangle at (254, 192) with width 18 and height 50.
; PLAN: r0=254(x), r1=192(y), r2=18(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 192
LDI r2, 18
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
