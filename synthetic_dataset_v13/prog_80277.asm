; DESCRIPTION: Draws a red rectangle at (368, 119) with width 106 and height 55.
; PLAN: r0=368(x), r1=119(y), r2=106(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 119
LDI r2, 106
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
