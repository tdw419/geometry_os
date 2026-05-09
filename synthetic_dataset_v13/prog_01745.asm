; DESCRIPTION: Draws a white rectangle at (437, 18) with width 50 and height 96.
; PLAN: r0=437(x), r1=18(y), r2=50(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 18
LDI r2, 50
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
