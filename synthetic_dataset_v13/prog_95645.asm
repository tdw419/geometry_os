; DESCRIPTION: Draws a red rectangle at (430, 47) with width 23 and height 108.
; PLAN: r0=430(x), r1=47(y), r2=23(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 47
LDI r2, 23
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
