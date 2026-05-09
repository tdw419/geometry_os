; DESCRIPTION: Draws a white rectangle at (175, 120) with width 38 and height 105.
; PLAN: r0=175(x), r1=120(y), r2=38(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 120
LDI r2, 38
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
