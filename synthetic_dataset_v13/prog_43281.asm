; DESCRIPTION: Draws a white rectangle at (342, 36) with width 108 and height 24.
; PLAN: r0=342(x), r1=36(y), r2=108(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 36
LDI r2, 108
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
