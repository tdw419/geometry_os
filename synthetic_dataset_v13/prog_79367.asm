; DESCRIPTION: Draws a blue rectangle at (129, 117) with width 98 and height 120.
; PLAN: r0=129(x), r1=117(y), r2=98(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 117
LDI r2, 98
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
