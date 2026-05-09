; DESCRIPTION: Draws a cyan rectangle at (375, 126) with width 50 and height 86.
; PLAN: r0=375(x), r1=126(y), r2=50(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 126
LDI r2, 50
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
