; DESCRIPTION: Draws a red rectangle at (172, 28) with width 22 and height 57.
; PLAN: r0=172(x), r1=28(y), r2=22(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 28
LDI r2, 22
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
