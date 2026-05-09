; DESCRIPTION: Draws a orange rectangle at (458, 190) with width 43 and height 21.
; PLAN: r0=458(x), r1=190(y), r2=43(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 190
LDI r2, 43
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
