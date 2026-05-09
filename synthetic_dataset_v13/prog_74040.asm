; DESCRIPTION: Draws a red rectangle at (72, 34) with width 34 and height 57.
; PLAN: r0=72(x), r1=34(y), r2=34(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 34
LDI r2, 34
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
