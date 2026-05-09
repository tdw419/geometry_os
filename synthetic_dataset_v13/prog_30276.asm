; DESCRIPTION: Draws a red rectangle at (334, 153) with width 98 and height 103.
; PLAN: r0=334(x), r1=153(y), r2=98(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 153
LDI r2, 98
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
