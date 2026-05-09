; DESCRIPTION: Draws a cyan rectangle at (136, 70) with width 65 and height 76.
; PLAN: r0=136(x), r1=70(y), r2=65(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 70
LDI r2, 65
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
