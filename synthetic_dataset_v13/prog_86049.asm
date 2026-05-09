; DESCRIPTION: Draws a white rectangle at (191, 162) with width 94 and height 50.
; PLAN: r0=191(x), r1=162(y), r2=94(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 162
LDI r2, 94
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
