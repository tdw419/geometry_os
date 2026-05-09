; DESCRIPTION: Draws a red rectangle at (269, 164) with width 102 and height 69.
; PLAN: r0=269(x), r1=164(y), r2=102(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 164
LDI r2, 102
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
