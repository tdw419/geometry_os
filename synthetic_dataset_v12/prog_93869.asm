; DESCRIPTION: Draws a orange rectangle at (271, 119) with width 46 and height 93.
; PLAN: r0=271(x), r1=119(y), r2=46(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 119
LDI r2, 46
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
