; DESCRIPTION: Draws a red rectangle at (356, 34) with width 31 and height 112.
; PLAN: r0=356(x), r1=34(y), r2=31(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 34
LDI r2, 31
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
