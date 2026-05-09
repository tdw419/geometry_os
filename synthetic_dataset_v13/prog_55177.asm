; DESCRIPTION: Draws a red rectangle at (293, 154) with width 14 and height 78.
; PLAN: r0=293(x), r1=154(y), r2=14(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 154
LDI r2, 14
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
