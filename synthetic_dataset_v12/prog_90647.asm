; DESCRIPTION: Draws a green rectangle at (365, 64) with width 65 and height 22.
; PLAN: r0=365(x), r1=64(y), r2=65(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 64
LDI r2, 65
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
