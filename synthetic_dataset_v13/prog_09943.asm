; DESCRIPTION: Draws a green rectangle at (329, 151) with width 10 and height 45.
; PLAN: r0=329(x), r1=151(y), r2=10(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 151
LDI r2, 10
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
