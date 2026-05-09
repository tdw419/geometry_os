; DESCRIPTION: Draws a red rectangle at (264, 225) with width 94 and height 18.
; PLAN: r0=264(x), r1=225(y), r2=94(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 225
LDI r2, 94
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
