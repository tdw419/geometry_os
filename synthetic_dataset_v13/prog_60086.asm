; DESCRIPTION: Draws a cyan rectangle at (421, 1) with width 87 and height 38.
; PLAN: r0=421(x), r1=1(y), r2=87(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 1
LDI r2, 87
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
