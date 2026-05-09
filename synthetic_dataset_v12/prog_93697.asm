; DESCRIPTION: Draws a white rectangle at (360, 98) with width 24 and height 71.
; PLAN: r0=360(x), r1=98(y), r2=24(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 98
LDI r2, 24
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
