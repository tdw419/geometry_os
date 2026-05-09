; DESCRIPTION: Draws a green rectangle at (242, 43) with width 90 and height 100.
; PLAN: r0=242(x), r1=43(y), r2=90(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 43
LDI r2, 90
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
