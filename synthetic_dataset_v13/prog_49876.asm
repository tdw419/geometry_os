; DESCRIPTION: Draws a purple rectangle at (171, 205) with width 27 and height 19.
; PLAN: r0=171(x), r1=205(y), r2=27(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 205
LDI r2, 27
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
