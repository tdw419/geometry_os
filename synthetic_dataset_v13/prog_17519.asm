; DESCRIPTION: Draws a red rectangle at (315, 210) with width 40 and height 31.
; PLAN: r0=315(x), r1=210(y), r2=40(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 210
LDI r2, 40
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
