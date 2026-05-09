; DESCRIPTION: Draws a cyan rectangle at (106, 12) with width 70 and height 76.
; PLAN: r0=106(x), r1=12(y), r2=70(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 12
LDI r2, 70
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
