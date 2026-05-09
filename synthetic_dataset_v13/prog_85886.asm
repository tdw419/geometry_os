; DESCRIPTION: Draws a yellow rectangle at (376, 47) with width 69 and height 80.
; PLAN: r0=376(x), r1=47(y), r2=69(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 47
LDI r2, 69
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
