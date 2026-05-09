; DESCRIPTION: Draws a red rectangle at (40, 3) with width 57 and height 109.
; PLAN: r0=40(x), r1=3(y), r2=57(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 3
LDI r2, 57
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
