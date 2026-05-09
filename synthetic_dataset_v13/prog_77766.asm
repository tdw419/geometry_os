; DESCRIPTION: Draws a cyan rectangle at (344, 52) with width 42 and height 116.
; PLAN: r0=344(x), r1=52(y), r2=42(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 52
LDI r2, 42
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
