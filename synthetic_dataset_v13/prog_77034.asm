; DESCRIPTION: Draws a orange rectangle at (458, 173) with width 40 and height 74.
; PLAN: r0=458(x), r1=173(y), r2=40(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 173
LDI r2, 40
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
