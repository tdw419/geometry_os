; DESCRIPTION: Draws a white rectangle at (333, 47) with width 119 and height 101.
; PLAN: r0=333(x), r1=47(y), r2=119(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 47
LDI r2, 119
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
