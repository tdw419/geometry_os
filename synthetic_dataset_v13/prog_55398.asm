; DESCRIPTION: Draws a orange rectangle at (340, 40) with width 45 and height 85.
; PLAN: r0=340(x), r1=40(y), r2=45(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 40
LDI r2, 45
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
