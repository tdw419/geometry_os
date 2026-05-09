; DESCRIPTION: Draws a red rectangle at (298, 102) with width 69 and height 103.
; PLAN: r0=298(x), r1=102(y), r2=69(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 102
LDI r2, 69
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
