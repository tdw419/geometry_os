; DESCRIPTION: Draws a cyan rectangle at (309, 9) with width 116 and height 42.
; PLAN: r0=309(x), r1=9(y), r2=116(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 9
LDI r2, 116
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
