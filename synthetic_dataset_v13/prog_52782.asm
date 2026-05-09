; DESCRIPTION: Draws a white rectangle at (20, 10) with width 107 and height 95.
; PLAN: r0=20(x), r1=10(y), r2=107(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 10
LDI r2, 107
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
