; DESCRIPTION: Draws a cyan rectangle at (160, 140) with width 66 and height 76.
; PLAN: r0=160(x), r1=140(y), r2=66(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 140
LDI r2, 66
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
