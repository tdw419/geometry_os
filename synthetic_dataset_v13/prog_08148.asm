; DESCRIPTION: Draws a red rectangle at (410, 75) with width 46 and height 99.
; PLAN: r0=410(x), r1=75(y), r2=46(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 75
LDI r2, 46
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
