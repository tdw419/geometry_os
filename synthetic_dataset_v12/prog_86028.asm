; DESCRIPTION: Draws a white rectangle at (319, 7) with width 42 and height 10.
; PLAN: r0=319(x), r1=7(y), r2=42(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 7
LDI r2, 42
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
