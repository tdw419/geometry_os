; DESCRIPTION: Draws a white rectangle at (468, 12) with width 33 and height 86.
; PLAN: r0=468(x), r1=12(y), r2=33(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 12
LDI r2, 33
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
