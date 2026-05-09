; DESCRIPTION: Draws a red rectangle at (338, 33) with width 73 and height 57.
; PLAN: r0=338(x), r1=33(y), r2=73(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 33
LDI r2, 73
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
