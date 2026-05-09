; DESCRIPTION: Draws a red rectangle at (360, 160) with width 119 and height 44.
; PLAN: r0=360(x), r1=160(y), r2=119(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 160
LDI r2, 119
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
