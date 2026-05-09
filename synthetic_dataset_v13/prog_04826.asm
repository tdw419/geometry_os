; DESCRIPTION: Draws a green rectangle at (365, 149) with width 34 and height 96.
; PLAN: r0=365(x), r1=149(y), r2=34(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 149
LDI r2, 34
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
