; DESCRIPTION: Draws a white rectangle at (468, 126) with width 22 and height 37.
; PLAN: r0=468(x), r1=126(y), r2=22(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 126
LDI r2, 22
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
