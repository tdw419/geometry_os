; DESCRIPTION: Draws a white rectangle at (154, 100) with width 78 and height 86.
; PLAN: r0=154(x), r1=100(y), r2=78(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 100
LDI r2, 78
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
