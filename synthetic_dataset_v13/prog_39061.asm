; DESCRIPTION: Draws a cyan rectangle at (233, 106) with width 69 and height 70.
; PLAN: r0=233(x), r1=106(y), r2=69(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 106
LDI r2, 69
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
