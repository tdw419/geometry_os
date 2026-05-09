; DESCRIPTION: Draws a red rectangle at (33, 48) with width 112 and height 62.
; PLAN: r0=33(x), r1=48(y), r2=112(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 48
LDI r2, 112
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
