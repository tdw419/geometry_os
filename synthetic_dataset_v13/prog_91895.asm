; DESCRIPTION: Draws a green rectangle at (205, 117) with width 34 and height 120.
; PLAN: r0=205(x), r1=117(y), r2=34(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 117
LDI r2, 34
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
