; DESCRIPTION: Draws a green rectangle at (168, 79) with width 35 and height 35.
; PLAN: r0=168(x), r1=79(y), r2=35(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 79
LDI r2, 35
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
