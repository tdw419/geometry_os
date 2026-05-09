; DESCRIPTION: Draws a white rectangle at (84, 27) with width 120 and height 68.
; PLAN: r0=84(x), r1=27(y), r2=120(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 27
LDI r2, 120
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
