; DESCRIPTION: Draws a white rectangle at (72, 225) with width 98 and height 24.
; PLAN: r0=72(x), r1=225(y), r2=98(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 225
LDI r2, 98
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
