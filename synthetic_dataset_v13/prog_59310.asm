; DESCRIPTION: Draws a white rectangle at (362, 153) with width 103 and height 96.
; PLAN: r0=362(x), r1=153(y), r2=103(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 153
LDI r2, 103
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
