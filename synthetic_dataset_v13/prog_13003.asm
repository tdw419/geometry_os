; DESCRIPTION: Draws a red rectangle at (153, 56) with width 104 and height 10.
; PLAN: r0=153(x), r1=56(y), r2=104(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 56
LDI r2, 104
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
