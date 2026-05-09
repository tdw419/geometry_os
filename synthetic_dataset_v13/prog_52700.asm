; DESCRIPTION: Draws a green rectangle at (298, 29) with width 34 and height 58.
; PLAN: r0=298(x), r1=29(y), r2=34(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 29
LDI r2, 34
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
