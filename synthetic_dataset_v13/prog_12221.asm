; DESCRIPTION: Renders a orange box of size 43x51 starting at (171, 176).
; PLAN: r0=171(x), r1=176(y), r2=43(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 176
LDI r2, 43
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
