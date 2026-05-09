; DESCRIPTION: Draws a black rectangle at (220, 140) with width 116 and height 16.
; PLAN: r0=220(x), r1=140(y), r2=116(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 140
LDI r2, 116
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
