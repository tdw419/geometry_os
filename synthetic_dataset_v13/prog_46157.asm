; DESCRIPTION: Draws a orange rectangle at (160, 18) with width 65 and height 34.
; PLAN: r0=160(x), r1=18(y), r2=65(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 18
LDI r2, 65
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
