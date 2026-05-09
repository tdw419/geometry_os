; DESCRIPTION: Draws a white rectangle at (344, 195) with width 98 and height 42.
; PLAN: r0=344(x), r1=195(y), r2=98(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 195
LDI r2, 98
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
