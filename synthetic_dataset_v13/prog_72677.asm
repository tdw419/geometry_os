; DESCRIPTION: Draws a red rectangle at (268, 46) with width 28 and height 72.
; PLAN: r0=268(x), r1=46(y), r2=28(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 46
LDI r2, 28
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
