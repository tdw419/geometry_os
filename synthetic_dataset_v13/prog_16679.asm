; DESCRIPTION: Draws a red rectangle at (3, 90) with width 104 and height 37.
; PLAN: r0=3(x), r1=90(y), r2=104(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 90
LDI r2, 104
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
