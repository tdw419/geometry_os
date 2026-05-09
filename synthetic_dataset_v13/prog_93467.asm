; DESCRIPTION: Draws a black rectangle at (103, 44) with width 115 and height 24.
; PLAN: r0=103(x), r1=44(y), r2=115(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 44
LDI r2, 115
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
