; DESCRIPTION: Draws a red rectangle at (342, 112) with width 19 and height 104.
; PLAN: r0=342(x), r1=112(y), r2=19(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 112
LDI r2, 19
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
