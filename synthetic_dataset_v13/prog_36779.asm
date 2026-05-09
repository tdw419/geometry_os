; DESCRIPTION: Draws a yellow rectangle at (76, 57) with width 50 and height 104.
; PLAN: r0=76(x), r1=57(y), r2=50(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 57
LDI r2, 50
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
