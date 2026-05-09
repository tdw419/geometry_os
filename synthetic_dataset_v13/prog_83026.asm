; DESCRIPTION: Draws a red rectangle at (342, 112) with width 35 and height 40.
; PLAN: r0=342(x), r1=112(y), r2=35(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 112
LDI r2, 35
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
