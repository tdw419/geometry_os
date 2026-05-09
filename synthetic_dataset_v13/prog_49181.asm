; DESCRIPTION: Draws a black rectangle at (328, 90) with width 13 and height 27.
; PLAN: r0=328(x), r1=90(y), r2=13(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 90
LDI r2, 13
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
