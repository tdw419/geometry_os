; DESCRIPTION: Draws a yellow rectangle at (171, 53) with width 115 and height 77.
; PLAN: r0=171(x), r1=53(y), r2=115(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 53
LDI r2, 115
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
