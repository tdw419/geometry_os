; DESCRIPTION: Draws a cyan rectangle at (344, 126) with width 107 and height 85.
; PLAN: r0=344(x), r1=126(y), r2=107(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 126
LDI r2, 107
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
