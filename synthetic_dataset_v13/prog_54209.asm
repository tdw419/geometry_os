; DESCRIPTION: Draws a red rectangle at (57, 124) with width 81 and height 47.
; PLAN: r0=57(x), r1=124(y), r2=81(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 124
LDI r2, 81
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
