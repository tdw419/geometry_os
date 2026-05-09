; DESCRIPTION: Draws a red rectangle at (342, 103) with width 94 and height 110.
; PLAN: r0=342(x), r1=103(y), r2=94(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 103
LDI r2, 94
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
