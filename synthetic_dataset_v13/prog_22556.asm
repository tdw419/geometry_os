; DESCRIPTION: Draws a white rectangle at (48, 12) with width 23 and height 85.
; PLAN: r0=48(x), r1=12(y), r2=23(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 12
LDI r2, 23
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
