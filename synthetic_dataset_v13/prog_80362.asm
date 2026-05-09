; DESCRIPTION: Draws a red rectangle at (329, 153) with width 103 and height 17.
; PLAN: r0=329(x), r1=153(y), r2=103(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 153
LDI r2, 103
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
