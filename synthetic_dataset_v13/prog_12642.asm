; DESCRIPTION: Draws a orange rectangle at (193, 171) with width 46 and height 11.
; PLAN: r0=193(x), r1=171(y), r2=46(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 171
LDI r2, 46
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
