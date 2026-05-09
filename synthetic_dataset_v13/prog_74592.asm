; DESCRIPTION: Draws a green rectangle at (236, 115) with width 115 and height 103.
; PLAN: r0=236(x), r1=115(y), r2=115(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 115
LDI r2, 115
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
