; DESCRIPTION: Draws a cyan rectangle at (255, 78) with width 42 and height 30.
; PLAN: r0=255(x), r1=78(y), r2=42(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 78
LDI r2, 42
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
