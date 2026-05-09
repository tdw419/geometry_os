; DESCRIPTION: Draws a red rectangle at (341, 180) with width 52 and height 76.
; PLAN: r0=341(x), r1=180(y), r2=52(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 180
LDI r2, 52
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
