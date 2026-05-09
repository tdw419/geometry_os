; DESCRIPTION: Draws a orange rectangle at (98, 171) with width 46 and height 27.
; PLAN: r0=98(x), r1=171(y), r2=46(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 171
LDI r2, 46
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
