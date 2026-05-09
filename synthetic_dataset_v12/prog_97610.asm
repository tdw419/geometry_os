; DESCRIPTION: Draws a red rectangle at (268, 33) with width 99 and height 39.
; PLAN: r0=268(x), r1=33(y), r2=99(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 33
LDI r2, 99
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
