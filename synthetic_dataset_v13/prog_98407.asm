; DESCRIPTION: Draws a red rectangle at (460, 81) with width 12 and height 36.
; PLAN: r0=460(x), r1=81(y), r2=12(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 81
LDI r2, 12
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
