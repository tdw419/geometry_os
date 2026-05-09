; DESCRIPTION: Draws a red rectangle at (461, 65) with width 46 and height 68.
; PLAN: r0=461(x), r1=65(y), r2=46(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 65
LDI r2, 46
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
