; DESCRIPTION: Draws a green rectangle at (178, 115) with width 40 and height 64.
; PLAN: r0=178(x), r1=115(y), r2=40(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 115
LDI r2, 40
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
