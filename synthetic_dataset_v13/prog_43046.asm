; DESCRIPTION: Draws a green rectangle at (279, 76) with width 16 and height 65.
; PLAN: r0=279(x), r1=76(y), r2=16(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 76
LDI r2, 16
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
