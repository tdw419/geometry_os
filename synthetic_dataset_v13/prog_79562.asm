; DESCRIPTION: Draws a white rectangle at (458, 90) with width 35 and height 46.
; PLAN: r0=458(x), r1=90(y), r2=35(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 90
LDI r2, 35
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
