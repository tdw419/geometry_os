; DESCRIPTION: Draws a white rectangle at (156, 126) with width 40 and height 98.
; PLAN: r0=156(x), r1=126(y), r2=40(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 126
LDI r2, 40
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
