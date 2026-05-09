; DESCRIPTION: Draws a green rectangle at (32, 105) with width 50 and height 120.
; PLAN: r0=32(x), r1=105(y), r2=50(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 105
LDI r2, 50
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
