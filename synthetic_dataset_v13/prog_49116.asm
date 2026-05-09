; DESCRIPTION: Draws a cyan rectangle at (160, 85) with width 112 and height 119.
; PLAN: r0=160(x), r1=85(y), r2=112(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 85
LDI r2, 112
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
