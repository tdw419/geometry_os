; DESCRIPTION: Draws a red rectangle at (141, 152) with width 52 and height 69.
; PLAN: r0=141(x), r1=152(y), r2=52(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 152
LDI r2, 52
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
