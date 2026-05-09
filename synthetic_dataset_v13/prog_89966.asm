; DESCRIPTION: Draws a red rectangle at (52, 124) with width 90 and height 11.
; PLAN: r0=52(x), r1=124(y), r2=90(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 124
LDI r2, 90
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
