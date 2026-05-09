; DESCRIPTION: Draws a white rectangle at (85, 38) with width 70 and height 103.
; PLAN: r0=85(x), r1=38(y), r2=70(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 38
LDI r2, 70
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
