; DESCRIPTION: Draws a red rectangle at (210, 103) with width 110 and height 70.
; PLAN: r0=210(x), r1=103(y), r2=110(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 103
LDI r2, 110
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
