; DESCRIPTION: Draws a cyan rectangle at (176, 40) with width 42 and height 78.
; PLAN: r0=176(x), r1=40(y), r2=42(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 40
LDI r2, 42
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
