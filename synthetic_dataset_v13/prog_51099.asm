; DESCRIPTION: Draws a white rectangle at (150, 109) with width 12 and height 24.
; PLAN: r0=150(x), r1=109(y), r2=12(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 109
LDI r2, 12
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
