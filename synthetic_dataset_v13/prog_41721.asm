; DESCRIPTION: Draws a red rectangle at (48, 135) with width 58 and height 114.
; PLAN: r0=48(x), r1=135(y), r2=58(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 135
LDI r2, 58
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
