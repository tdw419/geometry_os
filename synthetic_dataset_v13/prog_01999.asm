; DESCRIPTION: Draws a red rectangle at (414, 72) with width 69 and height 50.
; PLAN: r0=414(x), r1=72(y), r2=69(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 72
LDI r2, 69
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
