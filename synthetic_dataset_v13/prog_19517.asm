; DESCRIPTION: Draws a white rectangle at (295, 22) with width 35 and height 79.
; PLAN: r0=295(x), r1=22(y), r2=35(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 22
LDI r2, 35
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
