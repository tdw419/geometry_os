; DESCRIPTION: Draws a black rectangle at (363, 116) with width 27 and height 96.
; PLAN: r0=363(x), r1=116(y), r2=27(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 116
LDI r2, 27
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
