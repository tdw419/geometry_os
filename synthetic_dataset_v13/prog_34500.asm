; DESCRIPTION: Draws a red rectangle at (112, 72) with width 28 and height 58.
; PLAN: r0=112(x), r1=72(y), r2=28(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 72
LDI r2, 28
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
