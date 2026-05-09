; DESCRIPTION: Draws a white rectangle at (395, 139) with width 103 and height 86.
; PLAN: r0=395(x), r1=139(y), r2=103(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 139
LDI r2, 103
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
